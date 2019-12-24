package com.cook.util;

/**
 * @author 24367
 * @date 2019/12/24,16:51
 *
 * �ļ��ϴ��Ĺ�����
 */
public class UpLoadUtils {

    /**
     *
     * @param path �ļ���·��
     * @return �ļ�����
     */
    public static String getRealName(String path) {
        int index = path.lastIndexOf("\\");
        if (index == -1){
            index = path.lastIndexOf("/");
        }

        return path.substring(index+1);
    }

    public static String getDir(String name) {
        int i = name.hashCode();
        String hex = Integer.toHexString(i);
        int j = hex.length();

        for (int k = 0; k <8-j ; k++) {
            hex = "0" + hex;
        }

        return "/" + hex.charAt(0) + "/" + hex.charAt(1);
    }
}
