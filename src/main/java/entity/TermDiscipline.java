package entity;

public class TermDiscipline {
    private int id;
    private String id_term;
    private String id_discipline;

    public TermDiscipline() {
    }

    public TermDiscipline(int id, String id_term, String id_discipline) {
        this.id = id;
        this.id_term = id_term;
        this.id_discipline = id_discipline;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getId_term() {
        return id_term;
    }

    public void setId_term(String id_term) {
        this.id_term = id_term;
    }

    public String getId_discipline() {
        return id_discipline;
    }

    public void setId_discipline(String id_discipline) {
        this.id_discipline = id_discipline;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TermDiscipline)) return false;

        TermDiscipline that = (TermDiscipline) o;

        if (getId() != that.getId()) return false;
        if (getId_term() != null ? !getId_term().equals(that.getId_term()) : that.getId_term() != null) return false;
        return getId_discipline() != null ? getId_discipline().equals(that.getId_discipline()) : that.getId_discipline() == null;

    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + (getId_term() != null ? getId_term().hashCode() : 0);
        result = 31 * result + (getId_discipline() != null ? getId_discipline().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "TermDiscipline{" +
                "id=" + id +
                ", id_term='" + id_term + '\'' +
                ", id_discipline='" + id_discipline + '\'' +
                '}';
    }
}
