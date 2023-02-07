public class StringArrayTest {
    public static String[] generateStringArray(Integer sizeArray){
        String [] arrayCreated = new List<String>();
        for(Integer i=0; i<sizeArray; i++) {
            arrayCreated.add('Test '+i);
        }
        return arrayCreated;
    }
}