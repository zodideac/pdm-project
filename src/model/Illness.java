package model;

public class Illness {
    private String name;
    private String symptom;
    private String treatment;
    private String timeline;

    public Illness() {}

    public Illness(String name, String symptom, String treatment, String timeline) {
        this.name = name;
        this.symptom = symptom;
        this.treatment = treatment;
        this.timeline = timeline;
    }

    // Getter & Setter
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getSymptom() { return symptom; }
    public void setSymptom(String symptom) { this.symptom = symptom; }
    
    public String getTreatment() { return treatment; }
    public void setTreatment(String treatment) { this.treatment = treatment; }
    
    public String getTimeline() { return timeline; }
    public void setTimeline(String timeline) { this.timeline = timeline; }

    @Override
    public String toString() {
        return  "Illness [name=" + name + ", symptom=" + symptom + ", treatment=" + 
                treatment + ", timeline=" + timeline + "]";
    }
}
