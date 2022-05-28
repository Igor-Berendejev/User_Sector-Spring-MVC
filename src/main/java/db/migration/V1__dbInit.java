package db.migration;

import org.flywaydb.core.api.migration.BaseJavaMigration;
import org.flywaydb.core.api.migration.Context;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import java.io.File;
import java.net.URL;

public class V1__dbInit extends BaseJavaMigration {
    @Override
    public void migrate(Context context) throws Exception {
        JdbcTemplate template = new JdbcTemplate(new SingleConnectionDataSource(context.getConnection(), true));
        template.execute("CREATE TABLE sector (id integer PRIMARY KEY, name varchar(100) NOT NULL, base_sector_id integer);");
        template.execute("CREATE TABLE users (id SERIAL PRIMARY KEY, name varchar(30) NOT NULL UNIQUE, agreed_terms boolean);");
        template.execute("CREATE TABLE positions(id SERIAL PRIMARY KEY, user_id integer REFERENCES users(id), sector_id integer REFERENCES sector(id));");
        Document document = Jsoup.parse(new File("C:\\Users\\igor\\IdeaProjects\\HelmesTask\\src\\main\\webapp\\WEB-INF\\views\\startPage.jsp"));
        Element sectors =  document.getElementById("sectors");
        Elements options = sectors.children();
        for (Element e : options){
            String sector = e.text();
            String value = e.attr("value");
            template.update("INSERT INTO sector (id, name) VALUES (?, ?)", Integer.parseInt(value), sector);
        }


    }
}
