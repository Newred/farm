
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
	
	private JButton btnC;
	private JTextArea textArea;
	private JPanel contentPane;
	private ServerSocket ss;
	private int port = 9876;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					for(LookAndFeelInfo info: UIManager.getInstalledLookAndFeels()){
						if("Nimbus".equals(info)){
							UIManager.setLookAndFeel(info.getClassName());
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
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
		
		btnC = new JButton("Cоздать");
		btnC.addActionListener(btnClick);
		btnC.setBounds(335, 11, 89, 23);
		contentPane.add(btnC);
		
		JLabel lblLocalhost = new JLabel("localhost:9876");
		lblLocalhost.setBounds(30, 15, 102, 14);
		contentPane.add(lblLocalhost);
	}
	
	private ActionListener btnClick = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {
			textArea.append("1. подключится к базе данных\n");
			textArea.append("2. создать connection к клиенту!\n");
			
			@SuppressWarnings("unused")
			Connect con = new Connect(ss, port, textArea);
		}
	};
	
	public void SendInfo(String data)
	{
		textArea.append("SendInfo "+data);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
