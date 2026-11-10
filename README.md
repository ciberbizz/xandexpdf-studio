# XandexPDF Studio

**Maningue documentos. Uma só aplicação.**

Edição independente, gratuita e local, em português de Moçambique. Baseada no
[PdfCraft](https://github.com/storytold/pdfcraft), com licenças e créditos preservados.

## Estado

Primeira adaptação em desenvolvimento. Ainda não é um instalador Windows validado.
O fork está em [ciberbizz/xandexpdf-studio](https://github.com/ciberbizz/xandexpdf-studio).
A primeira adaptação é preparada na branch `xandex/pt-mz-foundation`.

O português de Moçambique abre por defeito. A tradução é uma adaptação inicial de
5.464 entradas pt-BR, com revisão editorial pendente.

| Função | Texto da edição moçambicana |
|---|---|
| Combinar ficheiros | Unir maningue documentos |
| Acção de entrada | Bora lá |
| Organização de páginas | Pôr as páginas em ordem |
| Compressão | Comprimir PDF — fica leve |
| Apresentação | Feito para partilhar, malta |

Guardar, apagar e proteger documentos usam termos explícitos.

## Compilar para desenvolvimento

Requer Rust **1.95 ou superior** e as dependências nativas da base. No Windows,
instalar também Visual Studio Build Tools com C++ e Windows SDK.

```sh
cargo build --locked -p pdfcraft
cargo run --locked -p pdfcraft
```

Os nomes internos dos crates e do executável de compilação continuam `pdfcraft`,
para facilitar actualizações da base. A interface usa XandexPDF Studio.
Os catálogos são incluídos a partir de `localization/locales`;
`CRAFT_I18N_DIR` permite substituir esse input durante a compilação.

Pacote de desenvolvimento portátil no Windows:

```powershell
powershell -File scripts/build-windows.ps1
```

O pacote guarda preferências em `XandexPDFData` junto do executável. Exige testes
no Windows e sem rede antes de distribuir. Modelos OCR e outros recursos opcionais
podem exigir preparação adicional; não se promete que todos estejam incluídos.

## Verificações

```sh
cargo fmt --check
cargo xtask assets
cargo test --locked -p pdfcraft-ui-egui --lib i18n::tests::mozambique
cargo test --locked -p pdfcraft
```

Ver [docs/XANDEX_ROADMAP.md](docs/XANDEX_ROADMAP.md) para próximos passos e limites.

## Licenças e autoria

Código sob **MIT OR Apache-2.0**. Direitos dos autores originais preservados.
Componentes e recursos: [NOTICE](NOTICE) e [ATTRIBUTION.md](ATTRIBUTION.md).
Traduções derivadas de craft-i18n: [localization/ATTRIBUTION.md](localization/ATTRIBUTION.md).

Esta edição não é afiliada à ArtCraft. Os seus logótipos e as capturas antigas foram
retirados. Os recursos herdados continuam sujeitos ao estado de desenvolvimento do PdfCraft.
