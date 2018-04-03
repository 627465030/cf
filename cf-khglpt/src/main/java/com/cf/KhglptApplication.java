package com.cf;

import com.cf.core.initializer.BaseInitializerDict;
import com.cf.core.mutidatasource.config.DynamicDataSourceRegister;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import javax.sql.DataSource;

/**
 * @Project : 
 * @Package Name : com.cf
 * @ClassName: HczzApplication
 * @Description : TODO
 * @Author : chenfeng
 * @Creation Date : 2018/1/19 15:34
 * @ModificationHistory Who When What
 * _________ ________________ ____________________________________________
 */
@SpringBootApplication
@MapperScan({"com.cf.khglpt.mybatis","com.cf.core.base.mybatis"})
@EnableTransactionManagement
@Import({DynamicDataSourceRegister.class}) // 注册动态多数据源
public class KhglptApplication {

    private static Logger log = LoggerFactory.getLogger(KhglptApplication.class);

    // 其中 dataSource 框架会自动为我们注入
    // 创建事务管理器1
    @Bean(name = "txManager1")
    public PlatformTransactionManager txManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    public static void main(String[] args) {
        SpringApplication.run(KhglptApplication.class,args);
        //log.info("============= SpringBoot Start Success =============");
    }

}
