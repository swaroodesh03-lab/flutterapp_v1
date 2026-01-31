import os
from PIL import Image

def remove_background(image_path, target_color=(186, 218, 229), threshold=40):
    img = Image.open(image_path).convert("RGBA")
    datas = img.getdata()

    new_data = []
    for item in datas:
        # Check if the color is close to the target light blue background
        r_diff = abs(item[0] - target_color[0])
        g_diff = abs(item[1] - target_color[1])
        b_diff = abs(item[2] - target_color[2])
        
        if r_diff < threshold and g_diff < threshold and b_diff < threshold:
            new_data.append((255, 255, 255, 0)) # Fully transparent
        else:
            new_data.append(item)

    img.putdata(new_data)
    img.save(image_path, "PNG")

char_dir = r"d:\flutterapp_v1\assets\images\characters"
for filename in os.listdir(char_dir):
    if filename.endswith(".png"):
        print(f"Processing {filename}...")
        remove_background(os.path.join(char_dir, filename))
print("Done!")
