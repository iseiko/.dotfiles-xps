package service;

import java.util.List;
import model.Aula;
import model.Deslocamento;

public class PagamentoService {

    public double calcularTotalAulas(List<Aula> aulas) {
        return aulas.size() * 40.0;
    }

    public double calcularTotalDeslocamento(List<Deslocamento> deslocamentos) {
        return deslocamentos.stream()
                .mapToDouble(Deslocamento::getCusto)
                .sum();
    }

    public double calcularTotalGeral(List<Aula> aulas, List<Deslocamento> deslocamentos) {
        return calcularTotalAulas(aulas) + calcularTotalDeslocamento(deslocamentos);
    }
}

// faz todo o calculo do deslocamento e da quantidade total de aulas e junta para dar tambem o autput de quanto vai receber no final 