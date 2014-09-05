
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/**
 * Check a file of strings to see if they end with a specific string.
 *
 * Created On: Mar 21, 2014
 * @author jknipp 
 *
 */
public class Main {

	public static void main (String[] args) {

	    try {
	        File file = new File(args[0]);
	        BufferedReader in = new BufferedReader(new FileReader(file));
	        String line;
	        while ((line = in.readLine()) != null) {
	            String[] la = line.split(",");
	            if (la.length > 0 && la.length == 2) {
//	            	System.out.println(la[0]);
	            	System.out.println( (la[0].trim().endsWith(la[1])) ? 1 : 0  );
	            } 
	        }
	    } catch (IOException e) {
	        System.out.println("File Read Error: " + e.getMessage());
	    }               
	}
}
