
import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import javax.swing.JTextArea;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;


public class FrameVille extends JFrame {


	private static final long serialVersionUID = 1L;
	
	private JButton button;
	private JTextArea textArea;
	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FrameVille frame = new FrameVille();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public FrameVille() {
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
		
		button = new JButton("\u0441\u043E\u0437\u0434\u0430\u0442\u044C");
		button.addActionListener(btnClick);
		button.setBounds(335, 11, 89, 23);
		contentPane.add(button);
		
		JLabel lblLocalhost = new JLabel("localhost:9876");
		lblLocalhost.setBounds(30, 15, 80, 14);
		contentPane.add(lblLocalhost);
	}
	
	private ActionListener btnClick = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {
			//System.out.println(" нажали на кнопку ");
			textArea.append("создать connection!\n");
		}
	};
}
