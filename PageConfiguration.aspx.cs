using System;
using System.Web.UI.WebControls;
using SiteServer.Plugins;
using SiteServer.Plugins.API;

namespace Plugin.Oss
{
    public class PageConfiguration : PluginPageBase
    {
        public CheckBox CbIsOss;
        public PlaceHolder PhOss;
        public TextBox TbAccessKeyId;
        public TextBox TbAccessKeySecret;
        public TextBox TbBucketName;
        public TextBox TbBucketEndPoint;
        public TextBox TbBucketPath;

        public void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            CbIsOss.Checked = Options.GetSiteOption(SiteId, Utils.OptionIsOss) == true.ToString();

            PhOss.Visible = CbIsOss.Checked;
            TbAccessKeyId.Text = Options.GetSiteOption(SiteId, Utils.OptionAccessKeyId);
            TbAccessKeySecret.Text = Options.GetSiteOption(SiteId, Utils.OptionAccessKeySecret);
            TbBucketName.Text = Options.GetSiteOption(SiteId, Utils.OptionBucketName);
            TbBucketEndPoint.Text = Options.GetSiteOption(SiteId, Utils.OptionBucketEndPoint);
            TbBucketPath.Text = Options.GetSiteOption(SiteId, Utils.OptionBucketPath);
        }

        public void CbIsOss_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            PhOss.Visible = CbIsOss.Checked;
        }

        public void Submit_OnClick(object sender, EventArgs e)
        {
            if (!Page.IsPostBack || !Page.IsValid) return;

            Options.SetSiteOption(SiteId, Utils.OptionIsOss, CbIsOss.Checked.ToString());
            Options.SetSiteOption(SiteId, Utils.OptionAccessKeyId, TbAccessKeyId.Text);
            Options.SetSiteOption(SiteId, Utils.OptionAccessKeySecret, TbAccessKeySecret.Text);
            Options.SetSiteOption(SiteId, Utils.OptionBucketName, TbBucketName.Text);
            Options.SetSiteOption(SiteId, Utils.OptionBucketEndPoint, TbBucketEndPoint.Text);
            Options.SetSiteOption(SiteId, Utils.OptionBucketPath, TbBucketPath.Text);

            //DataProvider.PublishmentSystemDao.Update(PublishmentSystemInfo);
        }
    }
}
