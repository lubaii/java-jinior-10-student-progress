package entity;

public class Semestr {
    int id;
    String name;

    public Semestr(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Semestr() {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Semestr)) return false;

        Semestr semestr = (Semestr) o;

        if (getId() != semestr.getId()) return false;
        return getName() != null ? getName().equals(semestr.getName()) : semestr.getName() == null;
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + (getName() != null ? getName().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Semestr{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
