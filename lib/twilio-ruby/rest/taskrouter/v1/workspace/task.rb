##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Taskrouter
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Taskrouter < TaskrouterBase
            class V1 < Version
                class WorkspaceContext < InstanceContext

                     class TaskList < ListResource
                    ##
                    # Initialize the TaskList
                    # @param [Version] version Version that contains the resource
                    # @return [TaskList] TaskList
                    def initialize(version, workspace_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { workspace_sid: workspace_sid }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks"
                        
                    end
                    ##
                    # Create the TaskInstance
                    # @param [String] timeout The amount of time in seconds the new task can live before being assigned. Can be up to a maximum of 2 weeks (1,209,600 seconds). The default value is 24 hours (86,400 seconds). On timeout, the `task.canceled` event will fire with description `Task TTL Exceeded`.
                    # @param [String] priority The priority to assign the new task and override the default. When supplied, the new Task will have this priority unless it matches a Workflow Target with a Priority set. When not supplied, the new Task will have the priority of the matching Workflow Target. Value can be 0 to 2^31^ (2,147,483,647).
                    # @param [String] task_channel When MultiTasking is enabled, specify the TaskChannel by passing either its `unique_name` or `sid`. Default value is `default`.
                    # @param [String] workflow_sid The SID of the Workflow that you would like to handle routing for the new Task. If there is only one Workflow defined for the Workspace that you are posting the new task to, this parameter is optional.
                    # @param [String] attributes A URL-encoded JSON string with the attributes of the new task. This value is passed to the Workflow's `assignment_callback_url` when the Task is assigned to a Worker. For example: `{ \\\"task_type\\\": \\\"call\\\", \\\"twilio_call_sid\\\": \\\"CAxxx\\\", \\\"customer_ticket_number\\\": \\\"12345\\\" }`.
                    # @return [TaskInstance] Created TaskInstance
                    def create(
                        timeout: :unset, 
                        priority: :unset, 
                        task_channel: :unset, 
                        workflow_sid: :unset, 
                        attributes: :unset
                    )

                        data = Twilio::Values.of({
                            'Timeout' => timeout,
                            'Priority' => priority,
                            'TaskChannel' => task_channel,
                            'WorkflowSid' => workflow_sid,
                            'Attributes' => attributes,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        TaskInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                        )
                    end

                
                    ##
                    # Lists TaskInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] priority The priority value of the Tasks to read. Returns the list of all Tasks in the Workspace with the specified priority.
                    # @param [Array[String]] assignment_status The `assignment_status` of the Tasks you want to read. Can be: `pending`, `reserved`, `assigned`, `canceled`, `wrapping`, or `completed`. Returns all Tasks in the Workspace with the specified `assignment_status`.
                    # @param [String] workflow_sid The SID of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this SID.
                    # @param [String] workflow_name The friendly name of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this friendly name.
                    # @param [String] task_queue_sid The SID of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this SID.
                    # @param [String] task_queue_name The `friendly_name` of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this friendly name.
                    # @param [String] evaluate_task_attributes The attributes of the Tasks to read. Returns the Tasks that match the attributes specified in this parameter.
                    # @param [String] ordering How to order the returned Task resources. y default, Tasks are sorted by ascending DateCreated. This value is specified as: `Attribute:Order`, where `Attribute` can be either `Priority` or `DateCreated` and `Order` can be either `asc` or `desc`. For example, `Priority:desc` returns Tasks ordered in descending order of their Priority. Multiple sort orders can be specified in a comma-separated list such as `Priority:desc,DateCreated:asc`, which returns the Tasks in descending Priority order and ascending DateCreated Order.
                    # @param [Boolean] has_addons Whether to read Tasks with addons. If `true`, returns only Tasks with addons. If `false`, returns only Tasks without addons.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(priority: :unset, assignment_status: :unset, workflow_sid: :unset, workflow_name: :unset, task_queue_sid: :unset, task_queue_name: :unset, evaluate_task_attributes: :unset, ordering: :unset, has_addons: :unset, limit: nil, page_size: nil)
                        self.stream(
                            priority: priority,
                            assignment_status: assignment_status,
                            workflow_sid: workflow_sid,
                            workflow_name: workflow_name,
                            task_queue_sid: task_queue_sid,
                            task_queue_name: task_queue_name,
                            evaluate_task_attributes: evaluate_task_attributes,
                            ordering: ordering,
                            has_addons: has_addons,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] priority The priority value of the Tasks to read. Returns the list of all Tasks in the Workspace with the specified priority.
                    # @param [Array[String]] assignment_status The `assignment_status` of the Tasks you want to read. Can be: `pending`, `reserved`, `assigned`, `canceled`, `wrapping`, or `completed`. Returns all Tasks in the Workspace with the specified `assignment_status`.
                    # @param [String] workflow_sid The SID of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this SID.
                    # @param [String] workflow_name The friendly name of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this friendly name.
                    # @param [String] task_queue_sid The SID of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this SID.
                    # @param [String] task_queue_name The `friendly_name` of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this friendly name.
                    # @param [String] evaluate_task_attributes The attributes of the Tasks to read. Returns the Tasks that match the attributes specified in this parameter.
                    # @param [String] ordering How to order the returned Task resources. y default, Tasks are sorted by ascending DateCreated. This value is specified as: `Attribute:Order`, where `Attribute` can be either `Priority` or `DateCreated` and `Order` can be either `asc` or `desc`. For example, `Priority:desc` returns Tasks ordered in descending order of their Priority. Multiple sort orders can be specified in a comma-separated list such as `Priority:desc,DateCreated:asc`, which returns the Tasks in descending Priority order and ascending DateCreated Order.
                    # @param [Boolean] has_addons Whether to read Tasks with addons. If `true`, returns only Tasks with addons. If `false`, returns only Tasks without addons.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(priority: :unset, assignment_status: :unset, workflow_sid: :unset, workflow_name: :unset, task_queue_sid: :unset, task_queue_name: :unset, evaluate_task_attributes: :unset, ordering: :unset, has_addons: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            priority: priority,
                            assignment_status: assignment_status,
                            workflow_sid: workflow_sid,
                            workflow_name: workflow_name,
                            task_queue_sid: task_queue_sid,
                            task_queue_name: task_queue_name,
                            evaluate_task_attributes: evaluate_task_attributes,
                            ordering: ordering,
                            has_addons: has_addons,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields TaskInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of TaskInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] priority The priority value of the Tasks to read. Returns the list of all Tasks in the Workspace with the specified priority.
                    # @param [Array[String]] assignment_status The `assignment_status` of the Tasks you want to read. Can be: `pending`, `reserved`, `assigned`, `canceled`, `wrapping`, or `completed`. Returns all Tasks in the Workspace with the specified `assignment_status`.
                    # @param [String] workflow_sid The SID of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this SID.
                    # @param [String] workflow_name The friendly name of the Workflow with the Tasks to read. Returns the Tasks controlled by the Workflow identified by this friendly name.
                    # @param [String] task_queue_sid The SID of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this SID.
                    # @param [String] task_queue_name The `friendly_name` of the TaskQueue with the Tasks to read. Returns the Tasks waiting in the TaskQueue identified by this friendly name.
                    # @param [String] evaluate_task_attributes The attributes of the Tasks to read. Returns the Tasks that match the attributes specified in this parameter.
                    # @param [String] ordering How to order the returned Task resources. y default, Tasks are sorted by ascending DateCreated. This value is specified as: `Attribute:Order`, where `Attribute` can be either `Priority` or `DateCreated` and `Order` can be either `asc` or `desc`. For example, `Priority:desc` returns Tasks ordered in descending order of their Priority. Multiple sort orders can be specified in a comma-separated list such as `Priority:desc,DateCreated:asc`, which returns the Tasks in descending Priority order and ascending DateCreated Order.
                    # @param [Boolean] has_addons Whether to read Tasks with addons. If `true`, returns only Tasks with addons. If `false`, returns only Tasks without addons.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TaskInstance
                    def page(priority: :unset, assignment_status: :unset, workflow_sid: :unset, workflow_name: :unset, task_queue_sid: :unset, task_queue_name: :unset, evaluate_task_attributes: :unset, ordering: :unset, has_addons: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Priority' => priority,
                            
                            'AssignmentStatus' =>  Twilio.serialize_list(assignment_status),
                            
                            'WorkflowSid' => workflow_sid,
                            
                            'WorkflowName' => workflow_name,
                            
                            'TaskQueueSid' => task_queue_sid,
                            
                            'TaskQueueName' => task_queue_name,
                            
                            'EvaluateTaskAttributes' => evaluate_task_attributes,
                            
                            'Ordering' => ordering,
                            
                            'HasAddons' => has_addons,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        TaskPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TaskInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TaskInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TaskPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Taskrouter.V1.TaskList>'
                    end
                end


                class TaskContext < InstanceContext
                    ##
                    # Initialize the TaskContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] workspace_sid The SID of the Workspace with the Task to update.
                    # @param [String] sid The SID of the Task resource to update.
                    # @return [TaskContext] TaskContext
                    def initialize(version, workspace_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, sid: sid,  }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks/#{@solution[:sid]}"

                        # Dependents
                        @reservations = nil
                    end
                    ##
                    # Delete the TaskInstance
                    # @param [String] if_match If provided, deletes this Task if (and only if) the [ETag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) header of the Task matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        if_match: :unset
                    )

                        headers = Twilio::Values.of({ 'If-Match' => if_match, })
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the TaskInstance
                    # @return [TaskInstance] Fetched TaskInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        TaskInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the TaskInstance
                    # @param [String] attributes The JSON string that describes the custom attributes of the task.
                    # @param [Status] assignment_status 
                    # @param [String] reason The reason that the Task was canceled or completed. This parameter is required only if the Task is canceled or completed. Setting this value queues the task for deletion and logs the reason.
                    # @param [String] priority The Task's new priority value. When supplied, the Task takes on the specified priority unless it matches a Workflow Target with a Priority set. Value can be 0 to 2^31^ (2,147,483,647).
                    # @param [String] task_channel When MultiTasking is enabled, specify the TaskChannel with the task to update. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`.
                    # @param [String] if_match If provided, applies this mutation if (and only if) the [ETag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) header of the Task matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [TaskInstance] Updated TaskInstance
                    def update(
                        attributes: :unset, 
                        assignment_status: :unset, 
                        reason: :unset, 
                        priority: :unset, 
                        task_channel: :unset, 
                        if_match: :unset
                    )

                        data = Twilio::Values.of({
                            'Attributes' => attributes,
                            'AssignmentStatus' => assignment_status,
                            'Reason' => reason,
                            'Priority' => priority,
                            'TaskChannel' => task_channel,
                        })

                        headers = Twilio::Values.of({ 'If-Match' => if_match, })
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        TaskInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the reservations
                    # @return [ReservationList]
                    # @return [ReservationContext] if sid was passed.
                    def reservations(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return ReservationContext.new(@version, @solution[:workspace_sid], @solution[:sid],sid )
                        end

                        unless @reservations
                            @reservations = ReservationList.new(
                                @version,
                                workspace_sid: @solution[:workspace_sid],
                                task_sid: @solution[:sid]
                                
                                )
                        end

                     @reservations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.TaskContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.TaskContext #{context}>"
                    end
                end

                class TaskPage < Page
                    ##
                    # Initialize the TaskPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TaskPage] TaskPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TaskInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TaskInstance] TaskInstance
                    def get_instance(payload)
                        TaskInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Taskrouter.V1.TaskPage>'
                    end
                end
                class TaskInstance < InstanceResource
                    ##
                    # Initialize the TaskInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Task
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TaskInstance] TaskInstance
                    def initialize(version, payload , workspace_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'age' => payload['age'] == nil ? payload['age'] : payload['age'].to_i,
                            'assignment_status' => payload['assignment_status'],
                            'attributes' => payload['attributes'],
                            'addons' => payload['addons'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'task_queue_entered_date' => Twilio.deserialize_iso8601_datetime(payload['task_queue_entered_date']),
                            'priority' => payload['priority'] == nil ? payload['priority'] : payload['priority'].to_i,
                            'reason' => payload['reason'],
                            'sid' => payload['sid'],
                            'task_queue_sid' => payload['task_queue_sid'],
                            'task_queue_friendly_name' => payload['task_queue_friendly_name'],
                            'task_channel_sid' => payload['task_channel_sid'],
                            'task_channel_unique_name' => payload['task_channel_unique_name'],
                            'timeout' => payload['timeout'] == nil ? payload['timeout'] : payload['timeout'].to_i,
                            'workflow_sid' => payload['workflow_sid'],
                            'workflow_friendly_name' => payload['workflow_friendly_name'],
                            'workspace_sid' => payload['workspace_sid'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'workspace_sid' => workspace_sid  || @properties['workspace_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TaskContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TaskContext.new(@version , @params['workspace_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Task resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The number of seconds since the Task was created.
                    def age
                        @properties['age']
                    end
                    
                    ##
                    # @return [Status] 
                    def assignment_status
                        @properties['assignment_status']
                    end
                    
                    ##
                    # @return [String] The JSON string with custom attributes of the work. **Note** If this property has been assigned a value, it will only be displayed in FETCH action that returns a single resource. Otherwise, it will be null.
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # @return [String] An object that contains the [addon](https://www.twilio.com/docs/taskrouter/marketplace) data for all installed addons.
                    def addons
                        @properties['addons']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Task entered the TaskQueue, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def task_queue_entered_date
                        @properties['task_queue_entered_date']
                    end
                    
                    ##
                    # @return [String] The current priority score of the Task as assigned to a Worker by the workflow. Tasks with higher priority values will be assigned before Tasks with lower values.
                    def priority
                        @properties['priority']
                    end
                    
                    ##
                    # @return [String] The reason the Task was canceled or completed, if applicable.
                    def reason
                        @properties['reason']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Task resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskQueue.
                    def task_queue_sid
                        @properties['task_queue_sid']
                    end
                    
                    ##
                    # @return [String] The friendly name of the TaskQueue.
                    def task_queue_friendly_name
                        @properties['task_queue_friendly_name']
                    end
                    
                    ##
                    # @return [String] The SID of the TaskChannel.
                    def task_channel_sid
                        @properties['task_channel_sid']
                    end
                    
                    ##
                    # @return [String] The unique name of the TaskChannel.
                    def task_channel_unique_name
                        @properties['task_channel_unique_name']
                    end
                    
                    ##
                    # @return [String] The amount of time in seconds that the Task can live before being assigned.
                    def timeout
                        @properties['timeout']
                    end
                    
                    ##
                    # @return [String] The SID of the Workflow that is controlling the Task.
                    def workflow_sid
                        @properties['workflow_sid']
                    end
                    
                    ##
                    # @return [String] The friendly name of the Workflow that is controlling the Task.
                    def workflow_friendly_name
                        @properties['workflow_friendly_name']
                    end
                    
                    ##
                    # @return [String] The SID of the Workspace that contains the Task.
                    def workspace_sid
                        @properties['workspace_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Task resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the TaskInstance
                    # @param [String] if_match If provided, deletes this Task if (and only if) the [ETag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) header of the Task matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        if_match: :unset
                    )

                        context.delete(
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Fetch the TaskInstance
                    # @return [TaskInstance] Fetched TaskInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the TaskInstance
                    # @param [String] attributes The JSON string that describes the custom attributes of the task.
                    # @param [Status] assignment_status 
                    # @param [String] reason The reason that the Task was canceled or completed. This parameter is required only if the Task is canceled or completed. Setting this value queues the task for deletion and logs the reason.
                    # @param [String] priority The Task's new priority value. When supplied, the Task takes on the specified priority unless it matches a Workflow Target with a Priority set. Value can be 0 to 2^31^ (2,147,483,647).
                    # @param [String] task_channel When MultiTasking is enabled, specify the TaskChannel with the task to update. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`.
                    # @param [String] if_match If provided, applies this mutation if (and only if) the [ETag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) header of the Task matches the provided value. This matches the semantics of (and is implemented with) the HTTP [If-Match header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match).
                    # @return [TaskInstance] Updated TaskInstance
                    def update(
                        attributes: :unset, 
                        assignment_status: :unset, 
                        reason: :unset, 
                        priority: :unset, 
                        task_channel: :unset, 
                        if_match: :unset
                    )

                        context.update(
                            attributes: attributes, 
                            assignment_status: assignment_status, 
                            reason: reason, 
                            priority: priority, 
                            task_channel: task_channel, 
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Access the reservations
                    # @return [reservations] reservations
                    def reservations
                        context.reservations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.TaskInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.TaskInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


