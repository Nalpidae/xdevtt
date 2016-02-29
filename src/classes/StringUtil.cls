/**
 * 文字列処理クラス
 *
 */
public with sharing class StringUtil {

    /** 半角スペース */
    private static final String SPACE_CHAR_HALF = ' ';

    /** 全角スペース */
    private static final String SPACE_CHAR_WID = '　';

    /**
     * 両端の空白（全角・半角）を除去します。
     *
     * @param value 対象文字列
     * @return trim後文字列
     */
    public static String trim(String value) {
        return ltrim(rtrim(value));
    }

    /**
     * 左側の空白（全角・半角）を除去します。
     *
     * @param value 対象文字列
     * @return 編集後文字列
     */
    public static String ltrim(String value) {

        if (value == null || value.equals('')) {
            return value;
        }

        Integer pos = 0;

        for (Integer i = 0; i < value.length(); i++) {
            //String c = value.charAt(i);
            String c = value.substring(i-1,i);
            if (c != SPACE_CHAR_HALF && c != SPACE_CHAR_WID) {
                break;
            }
            pos = i + 1;
        }

        if (pos > 0) {
            return value.substring(pos);
        } else {
            return value;
        }

    }

    /**
     * 右側の空白（全角・半角）を除去します。
     *
     * @param value 対象文字列
     * @return 編集後文字列
     */
    public static String rtrim(String value) {

        if (value == null || value.equals('')) {
            return value;
        }

        Integer pos = 0;

        for (Integer i = value.length() - 1; i >= 0; i--) {
            //String c = value.charAt(i);
            String c = value.substring(i-1,i);
            if (c != SPACE_CHAR_HALF && c != SPACE_CHAR_WID) {
                break;
            }
            pos = i;
        }

        if (pos > 0) {
            return value.substring(0, pos);
        } else {
            return value;
        }

    }

}