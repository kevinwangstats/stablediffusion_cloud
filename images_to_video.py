import os
import cv2
import argparse
from moviepy.editor import VideoFileClip, clips_array, TextClip

def extract_audio(input_video, output_audio):
    video = VideoFileClip(input_video)
    audio = video.audio
    audio.write_audiofile(output_audio, codec='mp3')

def create_video(input_folders, output_video, original_video):
    # Get a list of image files from input folders in alphabetical order
    image_files = []
    for folder in input_folders:
        image_files.extend(sorted([os.path.join(folder, filename) for filename in os.listdir(folder) if filename.endswith(('.jpg', '.png', '.jpeg'))]))

    # Get the width and height of the first image to set the video size
    first_image = cv2.imread(image_files[0])
    height, width, layers = first_image.shape

    # Define the codec and create a VideoWriter object with MP4 format
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    out = cv2.VideoWriter(output_video, fourcc, 30, (width, height))

    # Set the duration for each image (0.2 seconds)
    frame_duration = 0.2

    # Iterate through image files and write them to the video with a delay
    for image_file in image_files:
        frame = cv2.imread(image_file)
        for _ in range(int(30 * frame_duration)):  # 30 frames per second
            out.write(frame)

    # Release the VideoWriter object
    out.release()

    # Load the original video and extracted audio
    original_clip = VideoFileClip(original_video)
    audio_clip = VideoFileClip(output_video).set_audio(VideoFileClip(original_video).audio)

    # Concatenate the original video with the new video (without audio) and save the result
    final_clip = clips_array([[original_clip], [audio_clip.crossfadein(1).set_duration(original_clip.duration)]])
    final_output = output_video.split('.')[0] + '_with_audio.mp4'
    final_clip.write_videofile(final_output, codec='libx264', audio_codec='aac')

def main():
    parser = argparse.ArgumentParser(description='Combine images into an MP4 video with audio from an original video.')
    parser.add_argument('input_folders', nargs='+', help='List of input folders containing images')
    parser.add_argument('original_video', help='Original MP4 video file with audio')
    parser.add_argument('output_video', help='Output video file path (e.g., output.mp4)')
    
    args = parser.parse_args()

    # Extract audio from the original video and save it as an MP3 file
    audio_filename = 'extracted_audio.mp3'
    extract_audio(args.original_video, audio_filename)

    # Create the video with a delay between images
    create_video(args.input_folders, args.output_video, args.original_video)

    # Remove the temporary audio file
    os.remove(audio_filename)

if __name__ == '__main__':
    main()
    # python images_to_video.py ./img video/cxk.mp4 output/output_video.mp4 
