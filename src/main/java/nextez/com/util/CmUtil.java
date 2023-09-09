package nextez.com.util;

import java.nio.ByteBuffer;
import java.security.AlgorithmParameters;
import java.security.MessageDigest;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class CmUtil {

	/**
     * 비밀번호를 암호화하는 기능(복호화가 되면 안되므로 SHA-256 인코딩 방식 적용)
     * 
     * @param password 암호화될 패스워드
     * @param id salt로 사용될 사용자 ID 지정
     * @return
     * @throws Exception
     */
    public static String encryptPassword(String password, String id) throws Exception {

		if (password == null) {
		    return "";
		}
	
		byte[] hashValue = null; // 해쉬값
	
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		
		md.reset();
		md.update(id.getBytes());
		
		hashValue = md.digest(password.getBytes());
	
		return new String(Base64.encodeBase64(hashValue));
    }
    
    /**
     * AES256 암호화
     * 
     * 파일명 : encryptAES256
     * 작성일 : 2019. 7. 10. 오전 11:39:48
     * 작성자 : 최영철
     * @param msg
     * @param key
     * @return
     * @throws Exception
     */
    public static String encryptAES256(String msg, String key) throws Exception {

        SecureRandom random = new SecureRandom();

        byte bytes[] = new byte[20];

        random.nextBytes(bytes);

        byte[] saltBytes = bytes;



        // Password-Based Key Derivation function 2

        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

        // 70000번 해시하여 256 bit 길이의 키를 만든다.

        PBEKeySpec spec = new PBEKeySpec(key.toCharArray(), saltBytes, 70000, 256);



        SecretKey secretKey = factory.generateSecret(spec);

        SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");



        // 알고리즘/모드/패딩

        // CBC : Cipher Block Chaining Mode

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

        cipher.init(Cipher.ENCRYPT_MODE, secret);

        AlgorithmParameters params = cipher.getParameters();

        // Initial Vector(1단계 암호화 블록용)

        byte[] ivBytes = params.getParameterSpec(IvParameterSpec.class).getIV();



        byte[] encryptedTextBytes = cipher.doFinal(msg.getBytes("UTF-8"));



        byte[] buffer = new byte[saltBytes.length + ivBytes.length + encryptedTextBytes.length];

        System.arraycopy(saltBytes, 0, buffer, 0, saltBytes.length);

        System.arraycopy(ivBytes, 0, buffer, saltBytes.length, ivBytes.length);

        System.arraycopy(encryptedTextBytes, 0, buffer, saltBytes.length + ivBytes.length, encryptedTextBytes.length);



        return new String(Base64.encodeBase64(buffer));

    }
    
    /**
     * AES256 복호화
     * 
     * 파일명 : decryptAES256
     * 작성일 : 2019. 7. 10. 오전 11:40:07
     * 작성자 : 최영철
     * @param msg
     * @param key
     * @return
     * @throws Exception
     */
    public static String decryptAES256(String msg, String key) throws Exception {

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

        ByteBuffer buffer = ByteBuffer.wrap(Base64.decodeBase64(msg));



        byte[] saltBytes = new byte[20];

        buffer.get(saltBytes, 0, saltBytes.length);

        byte[] ivBytes = new byte[cipher.getBlockSize()];

        buffer.get(ivBytes, 0, ivBytes.length);

        byte[] encryoptedTextBytes = new byte[buffer.capacity() - saltBytes.length - ivBytes.length];

        buffer.get(encryoptedTextBytes);



        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

        PBEKeySpec spec = new PBEKeySpec(key.toCharArray(), saltBytes, 70000, 256);



        SecretKey secretKey = factory.generateSecret(spec);

        SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");



        cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(ivBytes));



        byte[] decryptedTextBytes = cipher.doFinal(encryoptedTextBytes);

        return new String(decryptedTextBytes);

    }


}
