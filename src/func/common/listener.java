package func.common;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.FileNotFoundException;

@WebListener
public class listener
        implements ServletContextListener  {

    @Override
    public void contextInitialized(ServletContextEvent arg0) {

        try {
            fileReader fR = new fileReader();
            fR.dburlReader();
        } catch (FileNotFoundException e){
            e.printStackTrace();
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {

    }


}
