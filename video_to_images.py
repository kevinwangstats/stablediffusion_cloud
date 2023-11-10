import os
import moviepy.editor as mp
import argparse
from PIL import Image


def extract_screenshots(video_path, output_dir, interval):
    # Load the video file
    video = mp.VideoFileClip(video_path)

    # Calculate the total number of screenshots based on video duration and interval
    total_frames = int(video.duration / interval)

    # Create the output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Loop through the video and capture screenshots
    for frame_num in range(total_frames):
        # Calculate the current time
        current_time = frame_num * interval

        # Capture a screenshot at the current time
        screenshot = video.get_frame(current_time)

        # Convert the NumPy array to a PIL Image
        pil_image = Image.fromarray(screenshot)

        # Save the screenshot with a sequentially numbered filename
        screenshot_filename = os.path.join(
            output_dir, f'screenshot_{frame_num + 1:04d}.png')
        pil_image.save(screenshot_filename)

    # Close the video file
    video.close()


def main():
    parser = argparse.ArgumentParser(
        description='Extract screenshots from a video at specified intervals.')
    parser.add_argument('video_path', help='Path to the input MP4 video file')
    parser.add_argument('output_dir', help='Directory to save the screenshots')
    parser.add_argument('--interval', type=float, default=0.2,
                        help='Time interval in seconds between screenshots')

    args = parser.parse_args()

    extract_screenshots(args.video_path, args.output_dir, args.interval)


if __name__ == '__main__':
    main()
    # python video_to_images.py video/cxk.mp4 img --interval 0.2
