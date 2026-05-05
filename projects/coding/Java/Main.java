import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import model.Aula;
import model.Deslocamento;
import service.PagamentoService;

public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        List<Aula> aulas = new ArrayList<>();
        List<Deslocamento> deslocamentos = new ArrayList<>();

        System.out.println("=== CALCULADORA DE PAGAMENTO ===");

        // AULAS
        System.out.print("Quantas aulas você deu? ");
        int qtdAulas = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < qtdAulas; i++) {
            aulas.add(new Aula());
        }

        // DESLOCAMENTOS
        System.out.print("\nQuantos deslocamentos? ");
        int qtdDesloc = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < qtdDesloc; i++) {
            System.out.println("\nDeslocamento " + (i + 1));
            System.out.print("Local (Asa Norte / Sudoeste): ");
            String local = sc.nextLine();

            deslocamentos.add(new Deslocamento(local));
        }

        // PROCESSAMENTO
        PagamentoService service = new PagamentoService();

        double totalAulas = service.calcularTotalAulas(aulas);
        double totalDesloc = service.calcularTotalDeslocamento(deslocamentos);
        double totalGeral = service.calcularTotalGeral(aulas, deslocamentos);

        // RESULTADO
        System.out.println("\n===== RESULTADO =====");
        System.out.printf("Total das aulas: R$ %.2f\n", totalAulas);
        System.out.printf("Total dos deslocamentos: R$ %.2f\n", totalDesloc);
        System.out.printf("TOTAL GERAL: R$ %.2f\n", totalGeral);

        sc.close();
    }
}

// basicamente serve para entrar com a quantidade de aulas e para onde foram os deslocamentos e "chama" as outras funções para que elas façam sua parte 

// ####################################################################################################################################################

// S single responsability, cada classe tem apenas uma coisa para fazer
// O open/closed, codigo aberto para extensão mas fechado para modificação nada deve ser substituido apenas adicionado
// L liskov, classes derivadas podem substituir classes bases sem alterar o funcionamento do programa a lógica precisa ser a mesma para todas as classes 
// I segregação de interface, uma classe não deve ser forçada a implementar metodos que ela não utiliza tudo precisa ser usado dentro daquela classe 
// D dependência, classes de alto nivel nao dependem de classes de alto nivel mas sim de abstrações exemplo de backend de internet usar iwd ou nm nao faz diferença para alguns frontend de internet