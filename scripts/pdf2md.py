import sys
import os
import pymupdf4llm

def convert_pdf_to_md(pdf_path, output_dir=None):
    if not os.path.exists(pdf_path):
        print(f"Error: File not found: {pdf_path}")
        return None

    md_text = pymupdf4llm.to_markdown(pdf_path)

    if output_dir is None:
        output_dir = os.path.dirname(pdf_path)

    os.makedirs(output_dir, exist_ok=True)
    base_name = os.path.splitext(os.path.basename(pdf_path))[0]
    output_path = os.path.join(output_dir, f"{base_name}.md")

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(md_text)

    os.remove(pdf_path)
    print(f"Converted & replaced: {pdf_path} -> {output_path}")
    return output_path


def batch_convert(input_dir, output_dir=None):
    if output_dir is None:
        output_dir = input_dir

    pdf_files = [f for f in os.listdir(input_dir) if f.lower().endswith(".pdf")]

    if not pdf_files:
        print(f"No PDF files found in: {input_dir}")
        return

    print(f"Found {len(pdf_files)} PDF file(s) in {input_dir}")
    for pdf_file in pdf_files:
        pdf_path = os.path.join(input_dir, pdf_file)
        convert_pdf_to_md(pdf_path, output_dir)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage:")
        print("  Single file:  python pdf2md.py <file.pdf> [output_dir]")
        print("  Batch folder: python pdf2md.py --batch <input_dir> [output_dir]")
        sys.exit(1)

    if sys.argv[1] == "--batch":
        input_dir = sys.argv[2] if len(sys.argv) > 2 else "."
        output_dir = sys.argv[3] if len(sys.argv) > 3 else None
        batch_convert(input_dir, output_dir)
    else:
        pdf_path = sys.argv[1]
        output_dir = sys.argv[2] if len(sys.argv) > 2 else None
        convert_pdf_to_md(pdf_path, output_dir)
