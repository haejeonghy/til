import { ApolloServer, gql} from "apollo-server"

let tweets = [
    {
        id:1,
        text:"졸려"
    },
    {
        id:2,
        text:"개잠옴"
    }
]

let users = [{
    id:"1",
    firstname:"nico",
    lastname:"las"
}]

const typeDefs = gql`
    type User {
        id:ID!  
        username:String!
        firstname:String!
        lastname:String!
        # resolver에서 재정의함
        fullname:String
    }
    type Tweet {
        id:ID!
        text:String!
        author:User!
    }

    type Query {
        allTweets:[Tweet!]!
        tweet(id:ID!):Tweet
        ping:String!
        allUsers:[User]
    }
    type Mutation {
        postTweet(text:String!, userId:ID!):Tweet!
        deleteTweet(id:ID!):Boolean!
    }
`;

const resolvers = {
    // 없는 필드 fullname에 대한 리졸버
    User: {
        fullname(root) {
            // root안에 조회한 위의 다른 nico user 데이터가 들어있음
            console.log(root)
            return "hello"
        }
    },
    Query: {
        tweet(root, {id}){
            return tweets.find((tweet) => tweet.id == id)
        }, 
        ping() {
            return "pong"
        },
        allTweets() {
            return tweets;
        },
        allUsers() {
            return users;
        }

    },
    Mutation: {
        postTweet(_, {text, userId}){
            const newTweet = {
                id:tweets.length+1,
                text
            };
            tweets.push(newTweet)
            return tweets[tweets.length -1]
        },
        deleteTweet(_, {id}) {
            const tweet = tweets.find(tweet => tweet.id == id)
            if(!tweet) return false
            tweets = tweets.filter(tweet => tweet.id != id)
            return true
        }
    }
}

const server = new ApolloServer({typeDefs, resolvers})
server.listen().then(({url}) => {
    console.log(`Running on ${url}`)
})