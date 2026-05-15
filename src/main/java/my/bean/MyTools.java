package my.bean;
public class MyTools {
    //实现字符串转换为整型
    public static int strToint(String str)
    {
        if(str==null||str.equals(""))
            str="0";
        int num=0;
        try {
            num=Integer.parseInt(str);
        } catch (Exception e) {
            num=0;
            e.printStackTrace();
        }
        return num;
    }
    //实现中文乱码处理
    public static String toChinese(String str)
    {
        if(str==null)
            str="";
        try {
            str=new String(str.getBytes("ISO-8859-1"),"utf-8");
        } catch (Exception e) {
            str="";
            e.printStackTrace();
        }
        return str;
    }
}
