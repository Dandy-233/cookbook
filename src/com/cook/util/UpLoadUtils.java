package com.cook.util;

/**
 * @author 24367
 * @date 2019/12/24,16:51
 *
 * 文件上传的工具类
 */
public class UpLoadUtils {

    /**
     *
     * @param path 文件的路径
     * @return 文件名称
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
