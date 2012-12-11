
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;
import javax.swing.border.EmptyBorder;
import javax.swing.JTextArea;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.net.ServerSocket;

import javax.swing.JLabel;


public class FrameVille extends JFrame {


	private static final long serialVersionUID = 1L;
	
	private JButton btnON;
	private JButton btnOFF;
	private JTextArea textArea;
	private JPanel contentPane;
	private ServerSocket ss;
	private int port = 9876;
	private Connect connection;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
				    for (LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
				        if ("Nimbus".equals(info.getName())) {
				            UIManager.setLookAndFeel(info.getClassName());
				            break;
				        }
				    }
				} catch (Exception e) {
				    // If Nimbus is not available, you can set the GUI to another look and feel.
				}
				
				FrameVille frame = new FrameVille();
				frame.setVisible(true);
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public FrameVille() {
		setTitle("FarmVille");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(null);
		setContentPane(contentPane);
		
		textArea = new JTextArea();
		JScrollPane sc = new JScrollPane(textArea);
		sc.setBounds(10, 59, 414, 192);
		contentPane.add(sc);
		
		btnON = new JButton("Подключить");
		btnON.setToolTipText("Сервер");
		btnON.addActionListener(btnONClick);
		btnON.setBounds(212, 19, 102, 28);
		contentPane.add(btnON);
		
		JLabel lblLocalhost = new JLabel("localhost:9876");
		lblLocalhost.setBounds(98, 26, 102, 14);
		contentPane.add(lblLocalhost);
		
		btnOFF = new JButton("Отключить");
		btnOFF.setToolTipText("Сервер");
		btnOFF.addActionListener(btnOFFClick);
		btnOFF.setBounds(326, 19, 102, 28);
		btnOFF.setEnabled(false);
		contentPane.add(btnOFF);
	}
	
	private ActionListener btnONClick = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {	
			textArea.append("\n1. подключится к базе данных");
			textArea.append("\n2. создать connection к клиенту!");
			btnOFF.setEnabled(true);
			btnON.setEnabled(false);
			createConnection();
		}
	};
	
	private ActionListener btnOFFClick = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {	
			textArea.append("\n1. удалить подключение");
			btnOFF.setEnabled(false);
			btnON.setEnabled(true);
			removeConnection();
		}
	};



	private void createDBconnect()
	{
		
	}

	private void createConnection()
	{
		if(connection != null)
			removeConnection();
		
		connection = new Connect(this, ss, port, textArea);
		connection.start();
	}
	
	private void removeConnection()
	{
		connection.remove();
		connection = null;
	}
	
	
	public void SendInfo(String data)
	{
		textArea.append("SendInfo "+data);
	}
	
	public void lostConnection(){
		//removeConnection();
		createConnection();
		createDBconnect();
	}
}
