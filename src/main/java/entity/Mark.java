package entity;

public class Mark {
    private int id;
    private int id_student;
    private int id_term_discipline;
    private String graduate;

    public Mark() {
    }

    public Mark(int id, int id_student, int id_term_discipline, String graduate) {
        this.id = id;
        this.id_student = id_student;
        this.id_term_discipline = id_term_discipline;
        this.graduate = graduate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_student() {
        return id_student;
    }

    public void setId_student(int id_student) {
        this.id_student = id_student;
    }

    public int getId_term_discipline() {
        return id_term_discipline;
    }

    public void setId_term_discipline(int id_term_discipline) {
        this.id_term_discipline = id_term_discipline;
    }

    public String getGraduate() {
        return graduate;
    }

    public void setGraduate(String graduate) {
        this.graduate = graduate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Mark)) return false;

        Mark mark = (Mark) o;

        if (getId() != mark.getId()) return false;
        if (getId_student() != mark.getId_student()) return false;
        if (getId_term_discipline() != mark.getId_term_discipline()) return false;
        return getGraduate() != null ? getGraduate().equals(mark.getGraduate()) : mark.getGraduate() == null;
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + getId_student();
        result = 31 * result + getId_term_discipline();
        result = 31 * result + (getGraduate() != null ? getGraduate().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Mark{" +
                "id=" + id +
                ", id_student=" + id_student +
                ", id_term_discipline=" + id_term_discipline +
                ", graduate='" + graduate + '\'' +
                '}';
    }
}
