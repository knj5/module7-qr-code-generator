import argparse
import os
import qrcode

parser = argparse.ArgumentParser()
parser.add_argument(
    "--url",
    default=os.getenv("QR_URL", "https://www.njit.edu")
)
args = parser.parse_args()

os.makedirs("qr_codes", exist_ok=True)

img = qrcode.make(args.url)
img.save("qr_codes/qrcode.png")

print(f"QR code generated for: {args.url}", flush=True)
print("Saved to qr_codes/qrcode.png", flush=True)
