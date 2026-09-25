defmodule Yic2.Seed.SeedApi do

    # -------------------
    # API definitions
    # -------------------

    # Form by Id API
    def api_fbyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
                %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/forms/:id" },
                %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/form" },
                %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detailsform" } ] }
    end

    # List all Forms API
    def api_laf do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/forms" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/formlist" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listform" } ] }
    end

    # List all Users API
    def api_lau do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/users" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/userlist" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listuser" } ] }
    end

    # User by Id API
    def api_ubyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/users/:id" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/user" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detailuser" } ] }
    end

    # Datadef by Id API
    def api_ddbyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/datadefs/:id" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/datadef" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detaildatadef" } ] }
    end

    # List all Datadefs API
    def api_ladd do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/datadefs" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/datadeflist" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listdatadef" } ] }
    end

    # Content template by Id API
    def api_ctbyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/templates/:id" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/contenttemplate" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detailcontenttemplate" } ] }
    end

    # Content item by Id API
    def api_cibyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/items/:id" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/contentitem" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detailcontentitem" } ] }
    end

    # List all Content templates API
    def api_lact do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/templates" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/contenttemplatelist" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listcontenttemplate" } ] }
    end

    # List all Content items API
    def api_laci do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/items" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/contentitemlist" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listcontentitem" } ] }
    end

    # Api by Id API
    def api_abyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/apis/:id" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/api" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detailapi" } ] }
    end

    # List api templates API
    def api_laa do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
              %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/apis" },
              %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/apilist" },
              %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listapi" } ] }
    end
    
    # FLow by Id API
    def api_flbyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
                %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/flows/:id" },
                %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/flow" },
                %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detailflow" } ] }
    end

    # List all FLows API
    def api_lafl do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
                %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/flows" },
                %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/flowlist" },
                %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listflow" } ] }
    end

    # Token by Id API
    def api_ftbyid do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
                %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/tokens/:id" },
                %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/token" },
                %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/detailtoken" } ] }
    end

    # List all Tokens API
    def api_laft do 
        %{ output: %{data: "data", datadef: "datadef", formdef: "formdef" }, actions: [
                %{ method: "get", output: "data", token: "jwt_local", url: "http://localhost:4000/api/tokens" },
                %{ method: "get", output: "datadef", token: "jwt_local", url: "http://localhost:4000/api/datadefbyname/tokenlist" },
                %{ method: "get", output: "formdef", token: "jwt_local", url: "http://localhost:4000/api/formbyname/listtoken" } ] }
    end

end