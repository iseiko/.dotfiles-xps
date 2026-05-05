for file in *.mp3; do
    title=$(yt-dlp --get-title "$file")
    mv "$file" "$title.mp3"
done

