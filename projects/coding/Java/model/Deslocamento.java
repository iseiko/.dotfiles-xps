package model;

public class Deslocamento {

    private String local;

    public Deslocamento(String local) {
        this.local = local.toLowerCase();
    }

    public double getCusto() {
        switch (local) {
            case "asa norte":
                return 7.60;
            case "sudoeste":
                return 15.20;
            default:
                return 0;
        }
    }

    public String getLocal() {
        return local;
    }
}

// guarda os locais e quanto que seria de deslocamento para cada local