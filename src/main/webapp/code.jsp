<%--
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"
					import="java.io.*,
									 java.util.*,
									 com.sun.image.codec.jpeg.*,
									 java.awt.*,
									 java.awt.image.*"%>
<%
		//1. ��֤�������ı�����
		String s = "";

        int intCount = 0;

        intCount = (new Random()).nextInt(9999);// 

        if (intCount < 1000)	// ����λ����ȫ
            intCount += 1000;

        s = intCount + "";
        // ������session,�������û���������бȽ�.
        // ע��Ƚ���֮�����session.
        session.setAttribute("validateCode", s);
        

		//2. ͨ��Java2D��ͼAPI����֤���ı�ת��ΪͼƬ
        BufferedImage image = new BufferedImage(35, 14,	// ָ������
                BufferedImage.TYPE_INT_RGB);

		// ��ͼ����Graphics
        Graphics gra = image.getGraphics();
        // ���ñ���ɫ
        gra.setColor(Color.GREEN);
        gra.fillRect(1, 1, 33, 12);
        // ��������ɫ
        gra.setColor(Color.black);
        gra.setFont(new Font("����", Font.PLAIN, 12));	// ָ�����塢��ʽ���ֺŴ�С
        // �������
        char c;

        for (int i = 0; i < 4; i++) {

            c = s.charAt(i);

            gra.drawString(c + "", i * 7 + 4, 11); // 7Ϊ��ȣ�11Ϊ���¸߶�λ��

        }

		//3.��̬���ɵ�ͼƬ������ͻ���
		response.setContentType("image/jpeg");
		
		OutputStream toClient = response.getOutputStream();	// ͼƬ����Ҫͨ��2��������ʽ����
		
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(toClient); // ����ͼƬ��ʽ����ת����

        encoder.encode(image);	// ת����������ͻ���

		toClient.close();

        out.clear();

		out = pageContext.pushBody();
%>--%>
