# Validação — primeira adaptação moçambicana

- Português/interface: 69 testes passaram, incluindo pt-MZ, persistência e idiomas das datas.
- Catálogos pt-MZ: 5.464 entradas, unicidade e placeholders verificados.
- Recursos/licenças: 326 recursos verificados; `cargo xtask license-check` passou.
- Arquitectura: 40 crates, sem violações de camadas.
- Formatação Rust e `git diff --check` verificados.
- Clippy com avisos como erros foi tentado e bloqueou em dois avisos preexistentes:
  `crates/edit/src/images.rs:248` e `crates/edit/src/hairlines.rs:199` (`collapsible_match`).
  Esses ficheiros não foram alterados nesta adaptação.
- Verificação nativa: `cargo check --locked -p pdfcraft` passou.
- WebAssembly: `cargo check --locked -p pdfcraft-ui-egui --target wasm32-unknown-unknown` passou, com avisos da base.
- Testes específicos do módulo de datas iniciados; ainda em compilação nesta revisão.
- Não foi gerado nem testado um executável Windows; revisão visual e testes de documentos pendentes.

Fork: https://github.com/ciberbizz/xandexpdf-studio
Branch: `xandex/pt-mz-foundation`. Esta etapa é uma proposta em desenvolvimento,
sem publicação de executáveis e sem equivalência prometida ao Acrobat.
