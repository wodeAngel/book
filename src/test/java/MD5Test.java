import com.oraclewdp.ddbookmaket.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class MD5Test {
    public static void main(String[] arge){
        String str="123";
        try {
            System.out.println(MD5Util.getEncryptedPwd(str));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
