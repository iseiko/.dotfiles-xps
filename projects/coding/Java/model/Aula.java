package model;

public class Aula {

    private static final double VALOR_FIXO = 40.0;
    private static final double DURACAO_HORAS = 1.5;

    public double calcularValor() {
        return VALOR_FIXO;
    }

    public double getDuracao() {
        return DURACAO_HORAS;
    }
}
// guarda os valores de cada aula e o tempo de duração das aulas