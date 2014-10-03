package ua.com.bitlab.springsecuritydemo;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;

/**
 * User: anna
 * Date: 10/12/12
 */
public class HibernateSchemaExporter {

    private static final String HIBERNATE_DIALECT = "org.hibernate.dialect.MySQL5InnoDBDialect";

    public static void main(String[] args) throws Exception {
        FileSystemXmlApplicationContext context = new FileSystemXmlApplicationContext("src/test/resources/spring/test-app-config.xml");
        LocalSessionFactoryBean sessionFactory = (LocalSessionFactoryBean) context.getBean("&sessionFactory");
        Configuration configuration = sessionFactory.getConfiguration();
        configuration.setProperty("hibernate.dialect", HIBERNATE_DIALECT);

        SchemaExport schemaExport = new SchemaExport(configuration);
        schemaExport.setOutputFile("schema.sql");
        schemaExport.setFormat(true);
        schemaExport.drop(false, true);
        schemaExport.create(false, true);

        schemaExport.execute(false, false, false, true);
    }

}
