package nextez.com.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

/**
 * 
 * jejusi 프로젝트
 * @version     : JDK 1.7
 * @packageName : nextez.com.cmm.web
 * @className   : NextezUtils.java
 * @since       : 2018. 6. 27.
 * @author      : O Seung min
 * <pre>
 * 
 *  수정일                   수정자                수정내용
 *  -----------     ------------   ---------------------------
 *  2018. 6. 27.    O Seung min    최초생성
 * 
 *
 * </pre>
 */
public class NextezUtils {
	
	//Logger log = Logger.getLogger(this.getClass());
	//private static Logger log = (Logger) LogManager.getLogger(this.getClass());
	
	/** 다운로드 버퍼 크기 */
	//private static final int BUFFER_SIZE = 4096; // 4kb
	
	/*
	public static void checkParamVO(Object argObj) {
        Object obj = argObj;
        ////System.out.println("\n*********VO*********** [ " + obj.getClass().getName() + " ] START ********************\n");
        for (Field field : obj.getClass().getDeclaredFields()){
            field.setAccessible(true);
            Object value;
            
            boolean isCatch = false;
            
			try {
				value = field.get(obj);
				////System.out.println( "* " + field.getName() + StringUtils.leftPad(" ", 30-field.getName().length()) + " : " + value + " ( SIZE = " + String.valueOf(value).length() + " )" );
			} catch (IllegalArgumentException e) {
				//e.printStackTrace();
				isCatch = true;
			} catch (IllegalAccessException e) {
				//e.printStackTrace();
				isCatch = true;
			}	            
        }
       // //System.out.println("\n*********VO*********** [ " + obj.getClass().getName() + " ]   END  *******************\n");        
	}
	*/
	
	/*
	public static void checkParamMap(Map<String, Object> argMap) throws Exception{
		Iterator<String> iterator = argMap.keySet().iterator();
        ////System.out.println("\n********Map*********** [ " + " ] START ********************\n");
        while(iterator.hasNext()){
        	String key   = (String)iterator.next();
			Object value = argMap.get(key);
			
			boolean isCatch = false;
			
			try{
				////System.out.println("* " + key + StringUtils.leftPad(" ", 30-key.length()) + " : " + value);
			} catch (IllegalArgumentException e) {
				//e.printStackTrace();
				isCatch = true;
			}
        }
        ////System.out.println("\n********Map*********** [ " + " ]   END  *******************\n");
	}
	*/
	
	/*
	public static void responseAjaxByMap(Map<String, Object> map, HttpServletResponse res, String logStr) {
		ObjectMapper mapper = new ObjectMapper();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter w;
		
		boolean isCatch = false;
		
		try {
			w = res.getWriter();
			w.write(mapper.writeValueAsString(map));
			w.flush();
			w.close();			
		} catch (IOException e) {
			try {
				throw new Exception("IOException" );
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				//e1.printStackTrace();
				isCatch = true;
			}
		}
	}
	*/
	
	/*
	public static void bind(HttpServletRequest request, Object obj) throws Exception {
		
		Method[] methods = obj.getClass().getMethods();
		for (Method method : methods) {         										
			if(method.getName().startsWith("set")) {     								
				String propertyName = method.getName().substring(3);  					
				String ConvpropertyName = propertyName.substring(0,1).toLowerCase() + propertyName.substring(1);
				if (method.getParameterTypes()[0].getSimpleName().equals("String")) {  	
					try {
						if (!request.getParameter(ConvpropertyName).equals(null) || !request.getParameter(propertyName).equals(null)){
							method.invoke(obj, (request.getParameter(ConvpropertyName)==null)?request.getParameter(propertyName):request.getParameter(ConvpropertyName));
						}
					} catch (Exception e) {
						// TODO: handle exception
						
					}
				}else if(method.getParameterTypes()[0].getSimpleName().equals("int")){
					try {
						if (!request.getParameter(ConvpropertyName).equals(null) || !request.getParameter(propertyName).equals(null)){
							method.invoke(obj, (request.getParameter(ConvpropertyName)==null)?Integer.parseInt(request.getParameter(propertyName).replace(",", "")):Integer.parseInt(request.getParameter(ConvpropertyName).replace(",",  "")));
						}
					} catch (Exception e) {
						//throw new DoException("Bind Error");
					}
				}else if(method.getParameterTypes()[0].getSimpleName().equals("long")){
					try {
						if (!request.getParameter(ConvpropertyName).equals(null) || !request.getParameter(propertyName).equals(null)){
							method.invoke(obj, (request.getParameter(ConvpropertyName)==null)?Long.parseLong(request.getParameter(propertyName).replace(",",  "")):Long.parseLong(request.getParameter(ConvpropertyName).replace(",",  "")));
						}
					} catch (Exception e) {
						//throw new DoException("Bind Error");
					}
				}else if(method.getParameterTypes()[0].getSimpleName().equals("Integer")){
					try {
						if (!request.getParameter(ConvpropertyName).equals(null) || !request.getParameter(propertyName).equals(null)){
							method.invoke(obj, (request.getParameter(ConvpropertyName)==null)?Integer.parseInt(request.getParameter(propertyName).replace(",",  "")):Integer.parseInt(request.getParameter(ConvpropertyName).replace(",",  "")));
						}
					} catch (Exception e) {
						//throw new DoException("Bind Error");
					}
				}
			}
		}
	}
	*/
	
	/*
	public static String getParamString(HttpServletRequest request) {
	    StringBuilder stringBuilder = new StringBuilder();
	    BufferedReader bufferedReader = null;
	    
	    //boolean isCatch = false;
	    
	    try {
	        InputStream inputStream = request.getInputStream();
	        if (inputStream != null) {
	            bufferedReader = new BufferedReader(new InputStreamReader(inputStream,"UTF-8"));    // 한글 깨짐 방지.
	            char[] charBuffer = new char[128];
	            int bytesRead = -1;
	            while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
	                stringBuilder.append(charBuffer, 0, bytesRead);
	            }
	        } else {
	            stringBuilder.append("");
	        }
	    } catch (IOException ex) {
	        //ex.printStackTrace();
	    	//isCatch = true;
	    } finally {
	        if (bufferedReader != null) {
	            try {
	                bufferedReader.close();
	            } catch (IOException ex) {
	            	//ex.printStackTrace();
	    	    	//isCatch = true;
	            }
	        }
	    }
	    
	    String builderStr = stringBuilder.toString();
	    
	    //초기화
	    stringBuilder = null;
	    
		return builderStr;
	}
	*/
	
	/*
	public static String clobToString(Clob clob) {
		if(clob != null && !clob.equals(null)){
			// reader를 생성
			Reader reader = null;
			
			//boolean isCatch = false;
			
			try {
				reader = clob.getCharacterStream();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				//isCatch = true;
			}

			StringBuffer out = new StringBuffer();
			char[] buff = new char[1024];
			int nchars = 0;

			// 스트링 버퍼에 append 시킨후
			try {
				while ((nchars = reader.read(buff)) > 0) {
					out.append(buff, 0, nchars);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				//isCatch = true;
			}
			return out.toString();
		}else{
			return "";
		}
	}
	*/
	
	public static void throwError(String errorCd) throws ModelAndViewDefiningException{
		String redirectPath = "redirect:/error.do?err=" + errorCd;
		ModelAndView modelAndView = new ModelAndView(redirectPath);
		throw new ModelAndViewDefiningException(modelAndView);
	}
	
	/*
	public static void fileDown(HttpServletRequest request, HttpServletResponse response, File file) throws Exception {
		if(!file.exists()) {
			throw new FileNotFoundException();
		}
		FileInputStream inputStream = null;
		
		// 아래 부분에서 euc-kr 을 utf-8 로 바꾸거나 URLEncoding을 안하거나 등의 테스트를
	    // 해서 한글이 정상적으로 다운로드 되는 것으로 지정한다.
	    String userAgent = request.getHeader("User-Agent");
	 
	    // attachment; 가 붙으면 IE의 경우 무조건 다운로드창이 뜬다. 상황에 따라 써야한다.
	    if (userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) { // MS IE 5.5 이하
	      response.setHeader("Content-Disposition", "filename=\"" + URLEncoder.encode(file.getName(), "UTF-8") + "\";");
	    } else if (userAgent != null && userAgent.indexOf("MSIE") > -1) { // MS IE (보통은 6.x 이상 가정)
	      response.setHeader("Content-Disposition", "attachment; filename=\"" + java.net.URLEncoder.encode(file.getName(), "UTF-8") + "\";");
	    } else { // 모질라나 오페라
	      response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(file.getName().getBytes("euc-kr"), "latin1") + "\";");
	    }
	    if(file.length() > 0) {
	    	response.setHeader("Content-Length", "" + file.length());
	    }
	    response.setContentType("application/octet-stream; charset=UTF-8");
	    response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		
		BufferedInputStream fin = null;
		BufferedOutputStream outs = null;
		
		boolean isCatch = false;
		
	    try {
	        inputStream = new FileInputStream(file);
	        
	        fin = new BufferedInputStream(inputStream);
		    outs = new BufferedOutputStream(response.getOutputStream());

		    byte[] outByte = new byte[BUFFER_SIZE];
			
			int read = 0;
			while ((read = fin.read(outByte)) != -1) {
				outs.write(outByte, 0, read);
			}
		} catch (IOException e) {
			throw new IOException();
		} finally {
			try {
				outs.close();
				fin.close();
				inputStream.close();
			} catch (IOException ex1) {
				isCatch = true;
			}
		}
   }	
	*/
	
	
	/**
	 * 문자열이 숫자인지 체크
	 * 메소드명 : isNumeric
	 * 작성일 : 2018. 9. 20. 오후 9:18:15
	 * 작성자 : 김승범
	 * @param s
	 * @return
	 */
	public static boolean isNumeric(String s) {
		try {
			Double.parseDouble(s);
			return true;
		} catch(NumberFormatException e) {
			return false;
		}
	}
	
	/**
	 * 3자리 마다 comma 로 구분지어 주는 문자열 생성
	 * 메소드명 : formatSeperatedByComma
	 * 작성일 : 2018. 9. 20. 오후 9:37:35
	 * 작성자 : 김승범
	 * @param val
	 * @return
	 */
	public static String formatSeperatedByComma(long val) {
        NumberFormat format = NumberFormat.getNumberInstance();
        return format.format(val);
    }
	
	/**
	 * 숫자+영문소문자 조합의 랜덤 문자열을 구한다.
	 * 메소드명 : randomString
	 * 작성일 : 2018. 9. 27. 오후 5:23:55
	 * 작성자 : 김승범
	 * @param stringSize : 문자열 길이
	 * @return
	 */
	/*
	public static String randomString(int stringSize) {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < stringSize; i++) {
		    int rIndex = rnd.nextInt(2);
		    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    default :
			    	break;
		    }
		}
		
		return temp.toString();
	}
	*/
	
	/**
	 * 파일 크기 표시
	 * 메소드명 : getFileSize
	 * 작성일 : 2018. 10. 6. 오전 7:13:31
	 * 작성자 : 김승범
	 * @param size
	 * @return
	 */
	public static String getFileSize(String size) {
		
		String gubn[] = {"Byte", "KB", "MB" } ;
		
		String returnSize = "";
		
		int gubnKey = 0;
		double changeSize = 0;
		long fileSize = 0;
		
		try {
			fileSize =  Long.parseLong(size);
			for( int x=0 ; (fileSize / (double)1024 ) >0 ; x++, fileSize/= (double) 1024 ) {
				gubnKey = x;
				changeSize = fileSize;
			}
			returnSize = changeSize + gubn[gubnKey];
		} catch ( NumberFormatException ex ) { 
			returnSize = "0.0 Byte"; 
		}
		
		//초기화
		gubn = null;

		return returnSize;
	}
	
	private static final int RATIO = 0;
    private static final int SAME = -1;
    
	public static Image setImage(File src) throws IOException {
        Image srcImg = null;
        String suffix = src.getName().substring(src.getName().lastIndexOf('.')+1).toLowerCase();
        if(suffix.equals("bmp")) {
        	srcImg = ImageIO.read(src);
        }
        else {
        	srcImg = new ImageIcon(src.toURI().toURL()).getImage();
        }
        return srcImg;
    }
	
	/**
     * 파일 크기를 변경합니다.<br>
     * 높이와 넓이값에 맞도록 파일 크기를 변경합니다.
     */
    public static void resizeImage(File src, File dest, int width, int height) throws IOException {
        Image srcImg = setImage(src);

        int srcWidth = srcImg.getWidth(null);
        int srcHeight = srcImg.getHeight(null);
        int destWidth = -1;
        int destHeight = -1;

        if(width == SAME) {
        	destWidth = srcWidth;
        }
        else if(width > 0) {
        	destWidth = width;
        }

        if(height == SAME) {
        	destHeight = srcHeight;
        }
        else if(height > 0) {
        	destHeight = height;
        }

        if(width == RATIO && height == RATIO) {
            destWidth = srcWidth;
            destHeight = srcHeight;
        }
        else if(width == RATIO) {
            double ratio = ((double) destHeight)/((double) srcHeight);
            destWidth = (int) (srcWidth*ratio)-1;
        }
        else if(height == RATIO) {
            double ratio = ((double) destWidth)/((double) srcWidth);
            destHeight = (int) (srcHeight*ratio)-1;
        }

        Image imgTarget = srcImg.getScaledInstance(destWidth,destHeight, Image.SCALE_SMOOTH);
        int pixels[] = new int[destWidth*destHeight];
        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, destWidth, destHeight, pixels, 0, destWidth);

        try {
            pg.grabPixels();
        } catch(InterruptedException e) {
            throw new IOException(e);
        }

        BufferedImage destImg = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_RGB);
        destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth);
        
        try {
        	ImageIO.write(destImg, "jpg", dest);
		} catch (IOException e) {
			// TODO: handle exception
			return;
		}
        
        //초기화
        srcImg = null;
        imgTarget = null;
        pixels = null;
        pg = null;
        destImg = null;
    }
    
    /**
     * 게시판에서 다음 Thread 를 구하는 함수
     * 메소드명 : boardNextThreadChar
     * 작성일 : 2018. 11. 6. 오후 10:50:35
     * 작성자 : 김승범
     * @param orgThread
     * @return
     */
    public static String boardNextThread(String orgThread) {
    	
    	//문자가 없으면
    	if(EgovStringUtil.isEmpty(orgThread)) {
    		return null;
    	}
    	
    	char alpa = orgThread.charAt(0);
    	int ialpa = (int)alpa;
    	
    	//A(65) ~ Y(89)가 이나면 다음 알파벳이 없기 때문에.
    	if(ialpa < 65 && ialpa > 89) {
    		return null;
    	}
    	
    	int nextApla = ++ialpa;
        char aString = (char)nextApla ;
        
        return String.valueOf(aString);
    }
    
    /**
     * 이미지가 포함된 html 태그에서 이미지 SRC 값을 추출하여 배열로 반환
     * 메소드명 : imgSrcGet
     * 작성일 : 2018. 11. 11. 오후 9:16:03
     * 작성자 : 김승범
     * @param withImgTagString
     * @return
     */
    public static List<String> imgSrcGet(String withImgTagString) {
    	
    	//사무장 <img src='/epostData/data/document/6510000/P328010/2018/11/P328010P1020102018111120392301_100_1.jpg'>,
    	
		String imgTxt = withImgTagString;
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
        Matcher matcher = pattern.matcher(imgTxt);
        
        List<String> imgSrc = new ArrayList<String>();
        
        while(matcher.find()){
        	imgSrc.add(matcher.group(1));
            ////System.out.println(matcher.group(1));
        }
        
        return imgSrc;
	}
    
    /**
     * 파라메터 경로 취약점 체크
     * 메소드명 : paramValueCheck
     * 작성일 : 2018. 11. 14. 오후 10:39:24
     * 작성자 : 김승범
     * @param paramStr
     * @return
     */
    public static String paramValueCheck(String paramStr) {
    	
    	String paramStr2 = "";
    	
    	if(EgovStringUtil.isNotEmpty(paramStr)) {
    		
        	// 수정 : 외부 입력값 필터링 
    		paramStr2 = paramStr.replaceAll("/","");
    		paramStr2 = paramStr2.replace("..","");
    		paramStr2 = paramStr2.replaceAll("&","");
        	
        	//정의된 값이기 때문에 다시 돌려놓는다.
    		paramStr2 = paramStr2.replaceAll("@","/");
    	}
		
    	return paramStr2;
    }
    
    
    
    /**
     * 온나라에서 넘어온 한글파일을 iso-8859-1 -> euc-kr 변환해주어야 한다.
     * 메소드명 : onnaraKrFileNameChange
     * 작성일 : 2019. 2. 9. 오전 9:53:15
     * 작성자 : 김승범
     * @param dirPath : 실제파일이 들어있는 경로
     * @param fileName : xml에서 추출한 실제 한글파일명
     */
    public static void onnaraKrFileNameChange(String dirPath, String fileName) {
    	File path = new File(dirPath);
    	File[] fileList2 = path.listFiles(); 
    	
    	//System.out.println("dirPath : " + dirPath);
    	//System.out.println("fileName : " + fileName);
    	 
    	if(fileList2.length > 0){
    	    for(int i=0; i < fileList2.length; i++){
    	    	//System.out.println(fileList2[i]) ;
    	    	
    	    	String dirFileFullPath = fileList2[i].toString();
    	    	String decFileFullPath = "";
    	    	String decFileName = "";
    	    	
    	    	/*
    	    	String decFileFullPath1 = "";
    	    	String decFileFullPath2 = "";
    	    	String decFileFullPath3 = "";
    	    	String decFileFullPath4 = "";
    	    	String decFileFullPath5 = "";
    	    	String decFileFullPath6 = "";
    	    	String decFileFullPath7 = "";
    	    	String decFileFullPath8 = "";
    	    	String decFileFullPath9 = "";
    	    	String decFileFullPath10 = "";
    	    	String decFileFullPath11 = "";
    	    	String decFileFullPath12 = "";
    	    	String decFileFullPath13 = "";
    	    	String decFileFullPath14 = "";
    	    	String decFileFullPath15 = "";
    	    	String decFileFullPath16 = "";
    	    	String decFileFullPath17 = "";
    	    	String decFileFullPath18 = "";
    	    	String decFileFullPath19 = "";
    	    	String decFileFullPath20 = "";
    	    	*/
    	    	
    	    	//디렉토리에 저장된 파일
    	    	File encFile = new File(dirFileFullPath);
    	    	String encFileName = encFile.getName();
    	    	
    	    	try {
	    	    	//온나라문서가 인코딩 되어 들어오기 때문에 체크하여 파일명을 변환시켜준다.
	    	    	decFileFullPath = new String(dirFileFullPath.getBytes("iso-8859-1"), "euc-kr");
	    	    	//한글로 변환한 파일명
	    	    	decFileName = new String(encFileName.getBytes("iso-8859-1"), "euc-kr");
	    	    	
	    	    	
	    	    	/*
	    	    	decFileFullPath1 = new String(dirFileFullPath.getBytes("utf-8"), "euc-kr");
	    	    	decFileFullPath2 = new String(dirFileFullPath.getBytes("utf-8"), "ksc5601");
	    	    	decFileFullPath3 = new String(dirFileFullPath.getBytes("utf-8"), "x-windows-949");
	    	    	decFileFullPath4 = new String(dirFileFullPath.getBytes("utf-8"), "iso-8859-1");
	    	    	
	    	    	decFileFullPath5 = new String(dirFileFullPath.getBytes("iso-8859-1"), "euc-kr");
	    	    	decFileFullPath6 = new String(dirFileFullPath.getBytes("iso-8859-1"), "ksc5601");
	    	    	decFileFullPath7 = new String(dirFileFullPath.getBytes("iso-8859-1"), "x-windows-949");
	    	    	decFileFullPath8 = new String(dirFileFullPath.getBytes("iso-8859-1"), "utf-8");
	    	    	
	    	    	decFileFullPath9 = new String(dirFileFullPath.getBytes("euc-kr"), "utf-8");
	    	    	decFileFullPath10 = new String(dirFileFullPath.getBytes("euc-kr"), "ksc5601");
	    	    	decFileFullPath11 = new String(dirFileFullPath.getBytes("euc-kr"), "euc-kr");
	    	    	decFileFullPath12 = new String(dirFileFullPath.getBytes("euc-kr"), "iso-8859-1");
	    	    	
	    	    	decFileFullPath13 = new String(dirFileFullPath.getBytes("ksc5601"), "euc-kr");
	    	    	decFileFullPath14 = new String(dirFileFullPath.getBytes("ksc5601"), "utf-8");
	    	    	decFileFullPath15 = new String(dirFileFullPath.getBytes("ksc5601"), "x-windows-949");
	    	    	decFileFullPath16 = new String(dirFileFullPath.getBytes("ksc5601"), "iso-8859-1");
	    	    	
	    	    	decFileFullPath17 = new String(dirFileFullPath.getBytes("x-windows-949"), "euc-kr");
	    	    	decFileFullPath18 = new String(dirFileFullPath.getBytes("x-windows-949"), "utf-8");
	    	    	decFileFullPath19 = new String(dirFileFullPath.getBytes("x-windows-949"), "ksc5601");
	    	    	decFileFullPath20 = new String(dirFileFullPath.getBytes("x-windows-949"), "iso-8859-1");
	    	    	*/
	    	    	
    	    	} catch (UnsupportedEncodingException e1) {
    				// TODO Auto-generated catch block
    				System.out.println(e1);
    				//e1.printStackTrace();
    			}
    	    	
    	    	
    	    	//System.out.println("불러올 파일명 - loadFile : " + fileName);
    	    	//System.out.println("디렉토리에 저장된 파일명 - savedFile : " + encFileName);
    	    	//System.out.println("디코딩된 파일명 - decodeFile : " + decFileName);
    	    	//System.out.println("디코딩시  파일 - decodeFileFullPath : " + dirFileFullPath);
    	    	

    	    	
    	    	
    	    	
    	    	
    	    	
    	    	
    	    	//1. 불러올 파일명과 디코딩된 파일명이 일치하면 해당 파일명을 불러올 파일명으로 변경한다.
    	    	if(fileName.equals(decFileName)) {
    	    		//System.out.println("okokokok");
    	    		
    	    		File decFile = new File(new String(decFileFullPath));
    	    		
    	    		/*
    	    		File decFile1 = new File(new String(decFileFullPath1));
    	    		File decFile2 = new File(new String(decFileFullPath2));
    	    		File decFile3 = new File(new String(decFileFullPath3));
    	    		File decFile4 = new File(new String(decFileFullPath4));
    	    		
    	    		File decFile5 = new File(new String(decFileFullPath5));
    	    		File decFile6 = new File(new String(decFileFullPath6));
    	    		File decFile7 = new File(new String(decFileFullPath7));
    	    		File decFile8 = new File(new String(decFileFullPath8));
    	    		
    	    		File decFile9 = new File(new String(decFileFullPath9));
    	    		File decFile10 = new File(new String(decFileFullPath10));
    	    		File decFile11 = new File(new String(decFileFullPath11));
    	    		File decFile12 = new File(new String(decFileFullPath12));
    	    		
    	    		File decFile13 = new File(new String(decFileFullPath13));
    	    		File decFile14 = new File(new String(decFileFullPath14));
    	    		File decFile15 = new File(new String(decFileFullPath15));
    	    		File decFile16 = new File(new String(decFileFullPath16));
    	    		
    	    		File decFile17 = new File(new String(decFileFullPath17));
    	    		File decFile18 = new File(new String(decFileFullPath18));
    	    		File decFile19 = new File(new String(decFileFullPath19));
    	    		File decFile20 = new File(new String(decFileFullPath20));
    	    		*/
    	    		
    	    		if(encFile.exists()) {
    	    			
    	    			//System.out.println("changeFileName");
    	    			encFile.renameTo(decFile); 
    	    			
    	    			/*
    	    			encFile.renameTo(decFile1); 
    	    			encFile.renameTo(decFile2); 
    	    			encFile.renameTo(decFile3); 
    	    			encFile.renameTo(decFile4); 
    	    			
    	    			encFile.renameTo(decFile5); 
    	    			encFile.renameTo(decFile6); 
    	    			encFile.renameTo(decFile7); 
    	    			encFile.renameTo(decFile8); 
    	    			
    	    			encFile.renameTo(decFile9); 
    	    			encFile.renameTo(decFile10); 
    	    			encFile.renameTo(decFile11); 
    	    			encFile.renameTo(decFile12); 
    	    			
    	    			encFile.renameTo(decFile13); 
    	    			encFile.renameTo(decFile14); 
    	    			encFile.renameTo(decFile15); 
    	    			encFile.renameTo(decFile16); 
    	    			
    	    			encFile.renameTo(decFile17); 
    	    			encFile.renameTo(decFile18); 
    	    			encFile.renameTo(decFile19); 
    	    			encFile.renameTo(decFile20); 
    	    			*/
    	    		}
    	    		else {
    	    			System.out.println("file not exist");
    	    		}
    	    		
    	    		//초기화
    	    		decFile = null;
    	    	}
    	    	
    	    	/*
    	    	String word = dirFileFullPath;
    			try {
    				System.out.println("fileName : " + fileName);
    				System.out.println("word : " + word);
    				
    				System.out.println("utf-8 -> euc-kr        : " + new String(word.getBytes("utf-8"), "euc-kr"));
    				System.out.println("utf-8 -> ksc5601       : " + new String(word.getBytes("utf-8"), "ksc5601"));
    				System.out.println("utf-8 -> x-windows-949 : " + new String(word.getBytes("utf-8"), "x-windows-949"));
    				System.out.println("utf-8 -> iso-8859-1    : " + new String(word.getBytes("utf-8"), "iso-8859-1"));
    				System.out.println("iso-8859-1 -> euc-kr        : " + new String(word.getBytes("iso-8859-1"), "euc-kr"));
    				System.out.println("iso-8859-1 -> ksc5601       : " + new String(word.getBytes("iso-8859-1"), "ksc5601"));
    				System.out.println("iso-8859-1 -> x-windows-949 : " + new String(word.getBytes("iso-8859-1"), "x-windows-949"));
    				System.out.println("iso-8859-1 -> utf-8         : " + new String(word.getBytes("iso-8859-1"), "utf-8"));
    				System.out.println("euc-kr -> utf-8         : " + new String(word.getBytes("euc-kr"), "utf-8"));
    				System.out.println("euc-kr -> ksc5601       : " + new String(word.getBytes("euc-kr"), "ksc5601"));
    				System.out.println("euc-kr -> x-windows-949 : " + new String(word.getBytes("euc-kr"), "x-windows-949"));
    				System.out.println("euc-kr -> iso-8859-1    : " + new String(word.getBytes("euc-kr"), "iso-8859-1"));
    				System.out.println("ksc5601 -> euc-kr        : " + new String(word.getBytes("ksc5601"), "euc-kr"));
    				System.out.println("ksc5601 -> utf-8         : " + new String(word.getBytes("ksc5601"), "utf-8"));
    				System.out.println("ksc5601 -> x-windows-949 : " + new String(word.getBytes("ksc5601"), "x-windows-949"));
    				System.out.println("ksc5601 -> iso-8859-1    : " + new String(word.getBytes("ksc5601"), "iso-8859-1"));
    				System.out.println("x-windows-949 -> euc-kr     : " + new String(word.getBytes("x-windows-949"), "euc-kr"));
    				System.out.println("x-windows-949 -> utf-8      : " + new String(word.getBytes("x-windows-949"), "utf-8"));
    				System.out.println("x-windows-949 -> ksc5601    : " + new String(word.getBytes("x-windows-949"), "ksc5601"));
    				System.out.println("x-windows-949 -> iso-8859-1 : " + new String(word.getBytes("x-windows-949"), "iso-8859-1"));
    			} catch (UnsupportedEncodingException e1) {
    				// TODO Auto-generated catch block
    				System.out.println(e1);
    				//e1.printStackTrace();
    			}
    			*/
    	    	
    			//초기화
    	    	encFile = null;
    	    	decFileFullPath = null;
    	    	decFileName = null;
    	    }
    	}
    	
    	//초기화
    	path = null;
    	fileList2 = null;
    	
    	
    	//System.out.println("fileName : " + fileName);
    }
    
    //문자열에서 공백의 갯수를 알아낸다.
    public static int spaceCntForStr(String str) {
    	
    	int space = 0;
    	
    	if(EgovStringUtil.isNotEmpty(str)) {
	    	for(int i = 0; i <str.length(); i++) {
	    		if(' ' == str.charAt(i)) {
	    			space++;
	    		}
			}
    	}
    	
    	return space;
    }
    
    //파일명에서 숫자 및 기호 ( '(',  ')' , ',' , '숫자' , '.' , '-' , '_' , '[' , ']' , '~' 만 남기고 모두 제거
    public static String changeSomeChar(String str) {
    	
    	StringBuilder sb = new StringBuilder();
    	
    	if(EgovStringUtil.isNotEmpty(str)) {
	    	for(int i = 0; i <str.length(); i++) {
	    		if('(' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if(')' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if(',' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('0' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('1' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('2' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('3' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('4' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('5' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('6' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('7' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('8' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('9' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('.' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('-' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('_' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('[' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if(']' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
	    		else if('~' == str.charAt(i)) {
	    			sb.append(str.charAt(i));
	    		}
			}
    	}
    	
    	return sb.toString();
    }
    
    //역순 int 정렬
    public static void reverseArrayInt(int[] array) {
        int temp;

        for (int i = 0; i < array.length / 2; i++) {
          temp = array[i];
          array[i] = array[(array.length - 1) - i];
          array[(array.length - 1) - i] = temp;
        }
      }
    
    
    /**
     * 리셋 패스워드 생성
     * 메소드명 : resetPwByNumAndLowercase
     * 작성일 : 2019. 5. 18. 오전 10:08:15
     * 작성자 : 김승범
     * @param pwLength
     * @return
     */
    public static String resetPwByNumAndLowercase(int pwLength) {
    	
    	Random rnd = new Random();

    	StringBuffer buf = new StringBuffer();

    	for(int i=0; i<pwLength; i++) {

    	    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.

    	    if(rnd.nextBoolean()) {

    	        buf.append((char)((int)(rnd.nextInt(26))+97));

    	    } 
    	    else {

    	        buf.append((rnd.nextInt(10)));

    	    }

    	}
    	
    	String bufStr = buf.toString();
    	
    	//초기화
    	rnd = null;
    	buf = null;    	

    	return bufStr;
    }
    
    
    /**
	 * 파일을 복사
	 * 메소드명 : ksbFileCopy
	 * 작성일 : 2018. 9. 22. 오후 4:34:56
	 * 작성자 : 김승범
	 * @param source : 원본파일 풀경로 (파일명 포함)
	 * @param targetPath : 복사될 파일 풀경로 (파일명 미포함)
	 * @param fileName : 로고파일명
	 * @return
	 */
	public static void ksbFileCopy(String source, String targetPath, String fileName) {
		//String destImgSrc = "";
		
		String paramfileName = fileName;
		
		//파일명은 랜덤으로 생성한다.
		
		//1. 확장자를 구한다.
		int pos = source.lastIndexOf( "." );
		String ext = source.substring( pos + 1 );
		
		//3. 확장자를 포함한 파일명을 구한다.
		String fileName2 = paramfileName + "." + ext;
		
		//4. 저장대상 풀 경로(파일명 포함)
		String targetFileFullPath = targetPath + fileName2;
		
		// 디렉토리가 존재하지 않으면 디렉토리 생성
		File cFile = new File(targetPath);
        if (!cFile.isDirectory()) {
        	
        	//수정:권한 설정
        	cFile.setExecutable(false,true);
        	cFile.setReadable(true);
        	cFile.setWritable(false,true);
        	
            boolean flag = cFile.mkdirs();
            
            if (!flag) {
                try {
					throw new IOException("Directory creation Failed ");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
					//log.debug("디렉토리 생성 오류");
					System.out.println("디렉토리 생성 오류");
				}
            }
        }
		
		//3. 저장할 디렉토리에 동일한 파일명이 있는지 확인한다.
		boolean isDuple = true;
		int i = 0;
		while(isDuple) {
			File file = new File(targetFileFullPath);
			//동일파일이 존재하면
			if(file.exists()) {
				paramfileName = paramfileName + "(" + i + ")";
				fileName2 = paramfileName + "." + ext;
				targetFileFullPath = targetPath + fileName2;
			}
			//동일파일이 존재하지 않으면
			else {
				isDuple = false;
			}
			
			//초기화
			file = null;
			
			i++;
		}
		
		//경로문자열 체크(보안취약점)
		//String storagePath = EgovProperties.getOptionalProp("STORAGE");
		//storagePath = NextezUtils.paramValueCheck(storagePath);
		
		//5. 디비에 저장할 path(파일명 포함)을 구한다.
		//destImgSrc = targetFileFullPath.replace(storagePath, "");
		
		FileInputStream fis = null;
		FileOutputStream fos = null;	
		
		//6. 파일복사
		try {
			fis = new FileInputStream(source);
			fos = new FileOutputStream(targetFileFullPath);		
   
			int data = 0;
			while((data=fis.read())!=-1) {
				fos.write(data);
			}
   
		} 
		catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			//log.debug("오류");

			System.out.println("오류");
			//destImgSrc = "";
		}
		finally {
			if(EgovStringUtil.isNotEmpty(fis)) {
				try {
					fis.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
					//log.debug("파일 닫기 오류");

					System.out.println("파일 닫기 오류");
				}
			}
			
			if(EgovStringUtil.isNotEmpty(fos)) {
				try {
					fos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
					//log.debug("파일 닫기 오류");
					//System.out.println("파일 닫기 오류");
				}	
			}
		}
		
		//초기화
		cFile = null;
		fis = null;
		fos = null;
		
		//return destImgSrc;
	}
}
