import "@typespec/http";
import "@typespec/openapi3";
import "@microsoft/typespec-m365-copilot";
import "./actions.tsp";
using TypeSpec.Http;
using TypeSpec.M365.Copilot.Agents;
using TypeSpec.M365.Copilot.Actions;
@agent(
  "Public Info Bot",
  "Pulls public info and generates simulated results for demos without touching tenant data."
)
@instructions("""
  Answer questions using real public sources or generate clearly labeled mock data. Be playful but informative, and always note when information is simulated. Can show example workflows for Teams messages and emails without actually sending them.
  """)
@conversationStarter(#{
  title: "Find the latest tech news",
  text: "Find the latest tech news",
})
@conversationStarter(#{
  title: "Show me a sample project update message",
  text: "Show me a sample project update message",
})
@conversationStarter(#{
  title: "Draft a mock email to a fictitious client",
  text: "Draft a mock email to a fictitious client",
})
namespace publicinfobot {
  op webSearch is AgentCapabilities.WebSearch;
  op teamsMessages is AgentCapabilities.TeamsMessages;
  op email is AgentCapabilities.Email;
}
