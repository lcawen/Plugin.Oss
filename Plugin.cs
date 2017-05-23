using System;
using System.IO;
using Aliyun.OSS;
using BaiRong.Core;
using SiteServer.Plugins;
using SiteServer.Plugins.API;

namespace Plugin.Oss
{
    public class Plugin : PluginBase
    {
        public override string Name => "Oss";
        public override string PluginUrl => string.Empty;
        public override string Description => string.Empty;
        public override string Version => "1.0.1";
        public override string Author => string.Empty;
        public override string AuthorUrl => string.Empty;

        public Plugin()
        {
            FileChanged += Plugin_FileChanged;
        }

        private static void Plugin_FileChanged(object sender, FileSystemEventArgs e)
        {
            try
            {
                if (e.ChangeType != WatcherChangeTypes.Changed && e.ChangeType != WatcherChangeTypes.Created) return;
                if (string.IsNullOrEmpty(Path.GetExtension(e.FullPath))) return;

                var filePath = e.FullPath;
                var siteId = Paths.GetSiteIdByFilePath(e.FullPath);
                if (siteId <= 0) return;
                var siteDirectoryPath = Paths.GetSiteDirectoryPath(siteId);
                if (string.IsNullOrEmpty(siteDirectoryPath)) return;

                var isOss = Options.GetSiteOption(siteId, Utils.OptionIsOss) == true.ToString();
                if (!isOss) return;

                var accessKeyId = Options.GetSiteOption(siteId, Utils.OptionAccessKeyId);
                var accessKeySecret = Options.GetSiteOption(siteId, Utils.OptionAccessKeySecret);
                var bucketName = Options.GetSiteOption(siteId, Utils.OptionBucketName);
                var bucketEndPoint = Options.GetSiteOption(siteId, Utils.OptionBucketEndPoint);
                var bucketPath = Options.GetSiteOption(siteId, Utils.OptionBucketPath);
                var key = (bucketPath + GetRelativePath(filePath, siteDirectoryPath)).Trim('/');

                if (string.IsNullOrEmpty(accessKeyId) || string.IsNullOrEmpty(accessKeySecret) ||
                    string.IsNullOrEmpty(bucketName) || string.IsNullOrEmpty(bucketEndPoint) ||
                    string.IsNullOrEmpty(key)) return;

                var client = new OssClient(bucketEndPoint, accessKeyId, accessKeySecret);
                client.PutObject(bucketName, key, filePath);
            }
            catch (Exception ex)
            {
                LogUtils.AddErrorLog(ex);
            }
        }

        private static string GetRelativePath(string filePath, string directoryPath)
        {
            var pathUri = new Uri(filePath);
            // Folders must end in a slash
            if (!directoryPath.EndsWith(Path.DirectorySeparatorChar.ToString()))
            {
                directoryPath += Path.DirectorySeparatorChar;
            }
            var folderUri = new Uri(directoryPath);
            return Uri.UnescapeDataString(folderUri.MakeRelativeUri(pathUri).ToString().Replace(Path.DirectorySeparatorChar, '/'));
        }
    }
}