

// const getUserIpAdress = () => {
//   const userIPinside = fetch('https://api.db-ip.com/v2/free/self')
//   .then(response => response.json())
//   .then( data => {
//     const {city, continentName, countryCode, ipAddress, stateProv} = data
//     console.log(city, data)
//   })  
// } 


// city: "Monterrey"
// continentCode: "NA"
// continentName: "North America"
// countryCode: "MX"
// countryName: "Mexico"
// ipAddress: "189.152.136.125"
// stateProv: "Nuevo León"

let visitorLocation
let visitorIp
let visitorUserAgent = navigator.userAgent
let visitorPlatform = navigator.platform

async function getUserIpAdress() {
  const response = await fetch('https://api.db-ip.com/v2/free/self', {});
  return await response.json();
}

getUserIpAdress().then(json => {
  visitorLocation = `${json.city}, ${json.stateProv}, ${json.countryName}`
  visitorIp = `${json.ipAddress}`
  console.log("IP", visitorIp," Location",  visitorLocation,"Agent", visitorUserAgent,"Platform", visitorPlatform)
  addVisitor({visitorLocation: visitorLocation,
              visitorIp: visitorIp,
              visitorUserAgent: visitorUserAgent,
              visitorPlatform: visitorPlatform
              })
  }
)

const addVisitor = ({
  visitorLocation,
  visitorIp,
  visitorUserAgent,
  visitorPlatform
  }) => { fetch("http://localhost:3000/users", {
    method: 'POST',
    headers: {
       'Content-Type': 'application/json',
    },
    body: JSON.stringify({
       ip: visitorIp,
       location: visitorLocation,
       platform: visitorPlatform,
       userAgent: visitorUserAgent
    })
 })
}