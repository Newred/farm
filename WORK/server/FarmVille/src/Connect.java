
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.JTextArea;

/**
 * 
 */

/**
 * @author Newred
 *
 */
public class Connect {
	
	//private String host;
	private int port;
	private ServerSocket ss;
	private Socket socket;
	private JTextArea textArea;
	
	private InputStream ist = null;
	private OutputStream ost = null;
	
	private DataInputStream is = null;
	private DataOutputStream os = null;
	
	
	
	public Connect(ServerSocket _ss, int _port, JTextArea _textArea){
		ss 	 		= _ss ;
		port 		= _port ;
		textArea	= _textArea ;
		textArea.append("Connect init");
		
			try {
				ss = new ServerSocket(port);
				textArea.append("ожидание подключения... \n");
				socket = ss.accept();
				textArea.append("клиент подключен.");
				
				
				
			} catch (IOException e) {
				//e.printStackTrace();
			}
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
