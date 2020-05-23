package entity;

import java.util.LinkedList;

public class Mark {
    private int mark;
    private Student student;
    private Discipline discipline;
    private Term term;

    public Mark() {
    }

    public Mark(int mark, Student student, Discipline discipline, Term term) {
        this.mark = mark;
        this.student = student;
        this.discipline = discipline;
        this.term = term;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Discipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }

    public Term getTerm() {
        return term;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Mark)) return false;

        Mark mark1 = (Mark) o;

        if (getMark() != mark1.getMark()) return false;
        if (getStudent() != null ? !getStudent().equals(mark1.getStudent()) : mark1.getStudent() != null) return false;
        if (getDiscipline() != null ? !getDiscipline().equals(mark1.getDiscipline()) : mark1.getDiscipline() != null)
            return false;
        return getTerm() != null ? getTerm().equals(mark1.getTerm()) : mark1.getTerm() == null;

    }

    @Override
    public int hashCode() {
        int result = getMark();
        result = 31 * result + (getStudent() != null ? getStudent().hashCode() : 0);
        result = 31 * result + (getDiscipline() != null ? getDiscipline().hashCode() : 0);
        result = 31 * result + (getTerm() != null ? getTerm().hashCode() : 0);
        return result;
    }

}