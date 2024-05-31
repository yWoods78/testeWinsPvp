---

# Sistema de Filas para PVP 💥🎮

Este é um sistema de simulação para montagem de grupos baseado em fila para um sistema de PvP (Player versus Player) desenvolvido para FiveM. O código Lua abaixo mostra a implementação desse sistema.

## 💡 Funcionamento

- O sistema mantém duas equipes, "atacantes" e "defensores", cada uma com um máximo de 5 jogadores.
- Quando uma equipe não está completa, o sistema busca jogadores na fila e os adiciona a uma equipe com espaço disponível.
- O código é executado de forma assíncrona para garantir um processamento contínuo, enquanto também coleta o lixo periodicamente para otimizar o uso de memória.

## 🚀 Como Usar

1. **Integração com o FiveM**: Este código pode ser integrado em um script Lua para FiveM.
2. **Configuração**: É possível ajustar o número máximo de jogadores por equipe ou o tempo de espera entre iterações do sistema.
3. **Implementação**: Utilize a função `getQueue()` para obter as equipes montadas pelo sistema.

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues para relatar problemas ou sugerir melhorias. Pull requests também são encorajados.

---