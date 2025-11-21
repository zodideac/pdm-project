package model;

public class Disease {
    private int diseaseId;
    private String name;
    private String description;
    private String severity;
    private boolean contagious;

    public Disease(int diseaseId, String name, String description,
                   String severity, boolean contagious) {
        this.diseaseId = diseaseId;
        this.name = name;
        this.description = description;
        this.severity = severity;
        this.contagious = contagious;
    }
    // Getter & Setter
    public int getDiseaseId() { return diseaseId; }
    public void setDiseaseId(int diseaseId) { this.diseaseId = diseaseId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getSeverity() { return severity; }
    public void setSeverity(String severity) { this.severity = severity; }

    public boolean isContagious() { return contagious; }
    public void setContagious(boolean contagious) { this.contagious = contagious; }

    @Override
    public String toString() {
        return "Disease{" +
                "diseaseId=" + diseaseId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", severity='" + severity + '\'' +
                ", contagious=" + contagious +
                '}';
    }
}
