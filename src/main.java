import data_access_object.*;
import model.*;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // test CRUD
        
        StudentDAO studentDAO = new StudentDAO();

        try {
            System.out.println("===== CREATE (Add Student) =====");
            Student newStudent = new Student("binh", "tran khanh",Date.valueOf("2006-12-09"),
            "nam", "example1@gmail.com", "0000", "ex address");
            boolean added = studentDAO.addStudent(newStudent);
            if (added) {
                System.out.println("Student added with ID: " + newStudent.getStudentId());
            }

            System.out.println("\n===== READ (Get All Students) =====");
            List<Student> students = studentDAO.getAllStudents();
            for (Student s : students) {
                System.out.println(s);
            }

            System.out.println("\n===== UPDATE (Change phone & email) =====");
            studentDAO.updateContactInfo(newStudent.getStudentId(), "0999888777", "newmail@gmail.com");
            System.out.println("Updated student with ID: " + newStudent.getStudentId());

            System.out.println("\n===== READ AGAIN =====");
            students = studentDAO.getAllStudents();
            for (Student s : students) {
                System.out.println(s);
            }

            System.out.println("\n===== DELETE (Remove student) =====");
            studentDAO.deleteStudent(newStudent.getStudentId());
            System.out.println("Deleted student with ID: " + newStudent.getStudentId());

            System.out.println("\n===== FINAL READ =====");
            students = studentDAO.getAllStudents();
            for (Student s : students) {
                System.out.println(s);
            }
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
}