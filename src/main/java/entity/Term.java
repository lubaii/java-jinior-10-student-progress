package entity;

import java.awt.*;
import java.util.LinkedList;

public class Term {
    private int id;
    private String name;
    private String duration;
    private LinkedList<Discipline> disciplines= new LinkedList<Discipline>();
    private LinkedList<Mark> marks = new LinkedList<Mark>();
    private LinkedList<Student> students = new LinkedList<Student>();

    public Term() {
    }

    public Term(int id, String name, String duration, LinkedList<Discipline> disciplines, LinkedList<Mark> marks, LinkedList<Student> students, Student stud) {
        this.id = id;
        this.name = name;
        this.duration = duration;
        this.disciplines = disciplines;
        this.marks = marks;
        this.students = students;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public LinkedList<Discipline> getDisciplines() {
        return disciplines;
    }

    public void setDisciplines(LinkedList<Discipline> disciplines) {
        this.disciplines = disciplines;
    }

    public LinkedList<Mark> getMarks() {
        return marks;
    }

    public void setMarks(LinkedList<Mark> marks) {
        this.marks = marks;
    }

    public LinkedList<Student> getStudents() {
        return students;
    }

    public void setStudents(LinkedList<Student> students) {
        this.students = students;
    }

//    public Student getStud() {
//        return stud;
//    }
//
//    public void setStud(Student stud) {
//        this.stud = stud;
//    }

    public void addDiscipline(Discipline discipline){
        disciplines.add(discipline);
    }

    public void addMark(Mark mark){
        marks.add(mark);
    }

    public void addStudent(Student student) { students.add(student); }
   // public Student addStudent(Student student) { return student; }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Term)) return false;

        Term term = (Term) o;

        if (getId() != term.getId()) return false;
        if (getName() != null ? !getName().equals(term.getName()) : term.getName() != null) return false;
        if (getDuration() != null ? !getDuration().equals(term.getDuration()) : term.getDuration() != null)
            return false;
        if (getDisciplines() != null ? !getDisciplines().equals(term.getDisciplines()) : term.getDisciplines() != null)
            return false;
        if (getMarks() != null ? !getMarks().equals(term.getMarks()) : term.getMarks() != null) return false;
        return getStudents() != null ? getStudents().equals(term.getStudents()) : term.getStudents() == null;

    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + (getName() != null ? getName().hashCode() : 0);
        result = 31 * result + (getDuration() != null ? getDuration().hashCode() : 0);
        result = 31 * result + (getDisciplines() != null ? getDisciplines().hashCode() : 0);
        result = 31 * result + (getMarks() != null ? getMarks().hashCode() : 0);
        result = 31 * result + (getStudents() != null ? getStudents().hashCode() : 0);
      //  result = 31 * result + (getStud() != null ? getStud().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Term{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", duration='" + duration + '\'' +
                ", disciplines=" + disciplines +
                ", marks=" + marks +
                ", students=" + students +
            //    ", stud=" + stud +
                '}';
    }
    /*public Term(LinkedList<Discipline> disciplines) {
        this.disciplines = disciplines;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public LinkedList<Discipline> getDisciplines() {
        return disciplines;
    }

    public void setDisciplines(LinkedList<Discipline> disciplines) {
        this.disciplines = disciplines;
    }

    public void addDiscipline(Discipline discipline){
        disciplines.add(discipline);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Term)) return false;

        Term term = (Term) o;

        if (getId() != term.getId()) return false;
        if (getName() != null ? !getName().equals(term.getName()) : term.getName() != null) return false;
        if (getDuration() != null ? !getDuration().equals(term.getDuration()) : term.getDuration() != null)
            return false;
        return getDisciplines() != null ? getDisciplines().equals(term.getDisciplines()) : term.getDisciplines() == null;

    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + (getName() != null ? getName().hashCode() : 0);
        result = 31 * result + (getDuration() != null ? getDuration().hashCode() : 0);
        result = 31 * result + (getDisciplines() != null ? getDisciplines().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Term{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", duration='" + duration + '\'' +
                ", disciplines=" + disciplines +
                '}';
    }*/
}
