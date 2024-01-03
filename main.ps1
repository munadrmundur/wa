# Initialize a new Git repository
git init

# Create a new file named "junk"
New-Item -Path ".\junk" -ItemType File -Force

# Get the beginning date from the user
$x = Read-Host "Enter Beginning date [yyyymmdd]"

# Get the end date from the user
$y = Read-Host "Enter End date [yyyymmdd]"

# Convert the input strings to DateTime objects
$startDate = [DateTime]::ParseExact($x, "yyyyMMdd", $null)
$endDate = [DateTime]::ParseExact($y, "yyyyMMdd", $null)

# Loop through the date range
$currentDate = $startDate
while ($currentDate -le $endDate) {
    # Append 'a' to the "junk" file
    Add-Content -Path ".\junk" -Value "a"

    # Stage the changes
    git add .

    # Commit the changes with a date-specific message
    $commitMessage = "commit$($currentDate.ToString("yyyyMMdd"))"
    git commit -m $commitMessage --date="$($currentDate.ToString("ddd MMM dd HH:mm:ss yyyy K"))"

    # Increment the date by one day
    $currentDate = $currentDate.AddDays(1)
}