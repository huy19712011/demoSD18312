package org.example.demosd18312.service;

import org.example.demosd18312.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentDataService {

    public static List<Student> getAllStudents() {

        List<Student> students = new ArrayList<>();
        students.add(new Student("A", "AA", "a@gmail.com"));
        students.add(new Student("B", "BB", "b@gmail.com"));
        students.add(new Student("C", "CC", "c@gmail.com"));

        return students;
    }
}
