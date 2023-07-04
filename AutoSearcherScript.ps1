

function Search($device) {

     $sleepAfterLoop = (Get-Random -Minimum 1500 -Maximum 3000) + 1000;       # determine length of sleep after the search loop

     if ($device -eq 1) {
             $numberOfSearches = Get-Random -Minimum 35 -Maximum 40;                  # determine number of iterations for the search loop 
     } else {
             $numberOfSearches = Get-Random -Minimum 23 -Maximum 25;                  # determine number of iterations for the search loop 
     }

    for ($counter = 0; $counter -lt $numberOfSearches; $counter++) { 

        $sleepDuringLoop = Get-Random -Minimum 0 -Maximum 100                 
        $RandomWord = Get-Random -InputObject (get-content ListOfWords.txt)
        $RandomQuestion = Get-Random -InputObject("What+is+","Definition+of+","Pronunciation+of+","Thesaurus+","Examples+of+","prefixes+for+","suffixes+for+")

        if ($sleepDuringLoop -gt 80) {           #determine if the loop should sleep
            $sleep = Get-Random -Minimum 1500 -Maximum 2000;
            start-sleep -Milliseconds $sleep;
        }

        
        if ($device -eq 0) {
            Start-Process http://www.bing.com/search?q=$RandomQuestion$RandomWord -WindowStyle Minimized
        } else {
            Start-Process microsoft-edge:http://www.bing.com/search?q=$RandomQuestion$RandomWord -WindowStyle Minimized
        }

        Add-Type -AssemblyName System.Windows.Forms
    }

    start-sleep -Milliseconds $sleepAfterLoop;

}

Search(0) # search mobile  - via chrome - requires mobile agent switcher chrome extension
taskkill /IM chrome.exe /F          
Search(1) # search desktop - via edge
taskkill /IM msedge.exe /F   

Start-Process microsoft-edge:https://rewards.bing.com 33-WindowStyle Minimized  # load rewards dashboard after searches complete