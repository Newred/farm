
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
public class Connect extends Thread {
	
	//private String host;
	private int port;
	private ServerSocket ss;
	private Socket socket;
	private JTextArea textArea;
	
	private InputStream sin = null;
	private OutputStream sout = null;
	
	private DataInputStream in = null;
	private DataOutputStream out = null;
	
	private FrameVille frameVille;
	
	
	
	public Connect(FrameVille _frameVille, ServerSocket _ss, int _port, JTextArea _textArea){
		ss 	 		= _ss ;
		port 		= _port ;
		textArea	= _textArea ;
		//textArea.append("\nConnect init");
		frameVille = _frameVille;
	}
	
	public void run(){
		try {
			ss = new ServerSocket(port);
			textArea.append("\nОжидание подключения...");
			
			socket = ss.accept();
			textArea.append("\nКлиент подключен.");
			
			sin  = socket.getInputStream();
			sout = socket.getOutputStream();
			
			in  = new DataInputStream(sin);
			out = new DataOutputStream(sout);
			
			String line = null;
			
			toClient("hello");
			
			while(true)
			{
				line = in.readUTF();
				textArea.append("\n"+line);
				fromClient(line);
			}
			
			
		} catch (IOException e) {
			//textArea.append("\nConnect.run() IOException");
			
		}
		finally{
			try {
				in.close();
				out.close();
				sin.close();
				sout.close();
				
			} catch (IOException e) {
				//textArea.append("\nConnect.finally() IOException");
			}catch (NullPointerException e){
				//textArea.append("\nConnect.finally() NullPointerException");
			}
			frameVille.lostConnection();
		}
	}
	
	private void fromClient(String data){
		frameVille.fromClient(data);
	}
	
	public void toClient(String data){
		
		try {
			out.writeUTF(data);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void remove(){
		try {
			if(socket == null) return ;
			socket.close();
			socket = null;

		} catch (IOException e) {
			textArea.append("\nConnect.remove() IOException");
		} catch (NullPointerException e){
			textArea.append("\nConnect.remove() NullPointerException");
		}
	}
	
	
	
	
	
	
	
	
	
	

	
	
}
