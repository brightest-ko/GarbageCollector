package common;

public class Util {
	public static int parseInt(String l) {
		try {
			int r = Integer.parseInt(l);
			return r;
		} catch (Exception e) {
			return -1;
		}
	}
	
	public static String h(String l){
		if(l == null || l.equals("")) return l;
		try{
			byte[] bs = l.getBytes("8859_1");
			l = new String(bs, "UTF-8");
		}catch(Exception e){}
		return l;
	}
}
