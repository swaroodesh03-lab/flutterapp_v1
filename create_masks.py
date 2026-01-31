from PIL import Image
import os

def extract_masks(base_image_path, output_dir):
    img = Image.open(base_image_path).convert("RGBA")
    datas = img.getdata()

    # Colors in Character1.png (determined from looking at the image)
    # Skin is roughly (253, 212, 187)
    # Hair is roughly (224, 105, 54)
    skin_target = (253, 212, 187)
    hair_target = (224, 105, 54)
    threshold = 60

    skin_mask_data = []
    hair_mask_data = []

    for item in datas:
        # Skin Mask
        sr_diff = abs(item[0] - skin_target[0])
        sg_diff = abs(item[1] - skin_target[1])
        sb_diff = abs(item[2] - skin_target[2])
        if sr_diff < threshold and sg_diff < threshold and sb_diff < threshold and item[3] > 0:
            skin_mask_data.append((255, 255, 255, 255))
        else:
            skin_mask_data.append((255, 255, 255, 0))

        # Hair Mask
        hr_diff = abs(item[0] - hair_target[0])
        hg_diff = abs(item[1] - hair_target[1])
        hb_diff = abs(item[2] - hair_target[2])
        if hr_diff < threshold and hg_diff < threshold and hb_diff < threshold and item[3] > 0:
            hair_mask_data.append((255, 255, 255, 255))
        else:
            hair_mask_data.append((255, 255, 255, 0))

    skin_mask = Image.new("RGBA", img.size)
    skin_mask.putdata(skin_mask_data)
    skin_mask.save(os.path.join(output_dir, "skin_mask.png"))

    hair_mask = Image.new("RGBA", img.size)
    hair_mask.putdata(hair_mask_data)
    hair_mask.save(os.path.join(output_dir, "hair_mask.png"))

base_path = r"d:\flutterapp_v1\assets\images\characters\Character1.png"
output_path = r"d:\flutterapp_v1\assets\images"
extract_masks(base_path, output_path)
print("Masks created in assets/images/")
