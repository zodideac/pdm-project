import model.Student;
public class main {
    public static void main(String[] args) {
        //test Student class
        Student student = new Student(1, "John", "A.", "Doe", "Male", "2000-01-01", "123 Main St");
        System.out.println("Student info: " + student);
    }
}
