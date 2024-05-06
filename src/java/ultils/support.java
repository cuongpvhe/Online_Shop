/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ultils;

public class support {

    /**
     *
     * @param x -> number must parse
     * @param defaultValue -> value want change if x is not number ?
     * @return
     */
    public static int parseInt(String x, int defaultValue) {
        int n = defaultValue;
        try {
            if (x != null) {
                n = Integer.parseInt(x);
                return n;
            }
        } catch (NumberFormatException e) {
            System.out.println("ultils -> support -> parseInt: \n" + e);
        }

        return n;
    }
    
    public boolean isChecked(String [] x, int value){
        for (String item : x) {
            if(parseInt(item, 0) == value){
                return true;
            }
        }
        return false;
    }
}
 