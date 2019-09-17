四个业务数据库：
cloud_admin
cloud_auth
course_classroom
course_coupon

一个nacos数据库：
nacos_config

先创建这五个数据库（utf8）,然后在相应的数据库中执行sql脚本。

nacos_config.sql为 nacos的数据库表文件，其中包含了各微服的配置数据，nacos的版本为1.0版本
通过导入此sql可以直接导入各微服务的配置项

