# SiteServer CMS 阿里云OSS插件

![SiteServer CMS 阿里云OSS云存储插件](http://www.siteserver.cn/assets/github-plugin-oss-banner.png)

## 插件简介

阿里云OSS插件用于同步站点文件至阿里云OSS云存储中，配置完成后系统将监控站点文件，一旦文件有变化将自动上传文件至云存储中。

## 如何安装

* 升级 SiteServer CMS 至最新版本
* 下载插件
* 将插件放到SiteFiles/Plugins/Plugin.Oss文件夹下
* 重启siteserver.exe

## 如何配置

* 进入阿里云控制台Access Key管理，获取Access Key ID和Access Key Secret
* 登录阿里云控制台，进入对象存储OSS，创建Bucket，在属性设置读写权限为公开读，记下Bucket名称
* 进入Bucket概览，获取Bucket EndPoint
* 设置云存储Bucket目录，站点的所有文件将存储在此根目录下，不设置为保存在根目录



## 注意

SiteServer CMS 插件规范正在制定中，API接口很可能将调整，此插件目前主要用于开发人员熟悉插件规范，暂不建议正式使用。