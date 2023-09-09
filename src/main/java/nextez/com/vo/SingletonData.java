package nextez.com.vo;

public class SingletonData {

	private static SingletonData one;
	    
    /** js css 갱신버전 */
    private String jsCssVersion;
	
	private SingletonData() {

    }

    public static SingletonData getInstance() {
        if(one == null) {
            one = new SingletonData();
        }
        return one;
    }

	public String getJsCssVersion() {
		return jsCssVersion;
	}

	public void setJsCssVersion(String jsCssVersion) {
		this.jsCssVersion = jsCssVersion;
	}
    
    
}
